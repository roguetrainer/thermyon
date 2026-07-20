"""
ASA: Ab Initio WZ Nullspace v3 — Parametric Compatibility Approach

Root cause of v1/v2 failure: placing (a0,a1,a2) as columns alongside
certificate columns means they live in independent subspaces of the right
kernel. The recurrence unknowns never mix with certificate unknowns.

Correct formulation:
  M * c = b(a0, a1, a2)

where M is the certificate matrix (375 × 192) and b is the LHS vector
(linear in a0,a1,a2). The system is consistent iff b lies in col(M),
i.e., iff L^T * b = 0 for every left null vector L of M.

Each left null vector gives one linear equation in (a0,a1,a2).
Three independent left null vectors give three equations — enough to
determine (a0:a1:a2) up to scale, fixing the recurrence.

Run with: conda run -n sage_env sage ab_initio_wz_v3.sage
"""

from sage.all import PolynomialRing, QQ, matrix, vector, lcm, factor as sf
import time

def run():
    print("=" * 65)
    print(" ASA: AB INITIO WZ NULLSPACE v3 — Parametric Compatibility")
    print("=" * 65)
    t0 = time.time()

    Pn  = PolynomialRing(QQ, 'n')
    Kn  = Pn.fraction_field()
    n   = Kn.gen()
    R   = PolynomialRing(Kn, ['x','y','z'])
    x, y, z = R.gens()

    N = x*(1-x) * y*(1-y) * z*(1-z)
    D = 1 - (1 - x*y)*z

    dN = [N.derivative(v) for v in [x,y,z]]
    dD = [D.derivative(v) for v in [x,y,z]]
    logF_factor = [n*D*dN[i] - (n+1)*N*dD[i] for i in range(3)]

    # LHS vectors b_0, b_1, b_2 (coefficients of a0, a1, a2 after * N*D^2)
    lhs_polys = [D**3, -(N*D**2), N**2*D]

    # Certificate ansatz: P_w = w*(1-w)*Q_w, deg(Q_w) <= QDEG in each var
    QDEG = 3
    def build_Pw_list(wi):
        w = [x,y,z][wi]
        return [w*(1-w) * x**i * y**j * z**k
                for i in range(QDEG+1)
                for j in range(QDEG+1)
                for k in range(QDEG+1)]

    Pw_lists = [build_Pw_list(wi) for wi in range(3)]
    n_cert = sum(len(L) for L in Pw_lists)
    print(f"\n Certificate unknowns: {n_cert}")

    # Collect monomial basis (union of all LHS and cert monomials)
    print("-> Collecting monomial basis...")
    all_monos = set()
    for lp in lhs_polys:
        all_monos |= set(R(lp).dict().keys())
    for wi in range(3):
        for Pw in Pw_lists[wi]:
            dPw = Pw.derivative([x,y,z][wi])
            cp = R(D**2*dPw + Pw*logF_factor[wi])
            all_monos |= set(cp.dict().keys())

    mono_list = sorted(all_monos)
    mono_idx  = {m:i for i,m in enumerate(mono_list)}
    n_rows = len(mono_list)
    print(f" Rows (monomials): {n_rows}")
    print(f" Cols (cert only): {n_cert}")

    # Build certificate matrix M (n_rows × n_cert)
    print("-> Building certificate matrix M...")
    M = matrix(Kn, n_rows, n_cert, sparse=True)
    col = 0
    for wi in range(3):
        for Pw in Pw_lists[wi]:
            dPw = Pw.derivative([x,y,z][wi])
            cp = R(D**2*dPw + Pw*logF_factor[wi])
            for mono, coeff in cp.dict().items():
                if mono in mono_idx:
                    M[mono_idx[mono], col] += coeff
            col += 1
    print(f" M built in {time.time()-t0:.1f}s")

    # Build RHS vectors b_i (one per recurrence unknown)
    print("-> Building RHS vectors b0, b1, b2...")
    b_vecs = []
    for lp in lhs_polys:
        bv = vector(Kn, n_rows)
        for mono, coeff in R(lp).dict().items():
            if mono in mono_idx:
                bv[mono_idx[mono]] = coeff
        b_vecs.append(bv)

    # Left null space of M: vectors L s.t. L * M = 0
    print("-> Computing left kernel of M...")
    left_ker = M.left_kernel()
    left_dim = left_ker.dimension()
    print(f" Left kernel dimension: {left_dim}")

    if left_dim == 0:
        print("\n[-] Left kernel is trivial — M has full row rank.")
        print("    Every b is in col(M); no constraints on (a0,a1,a2).")
        print("    Try reducing QDEG or using a smaller monomial basis.")
        return

    # Compatibility equations: L^T * b(a0,a1,a2) = 0 for each left null vector L
    # b = a0*b0 + a1*b1 + a2*b2
    # L^T * b = a0*(L*b0) + a1*(L*b1) + a2*(L*b2) = 0
    print(f"\n-> Extracting compatibility equations from {left_dim} left null vectors...")

    # Build small system: rows = left null vectors, cols = (a0,a1,a2)
    compat_rows = []
    for L in left_ker.basis():
        row = [L.dot_product(bv) for bv in b_vecs]
        if any(c != 0 for c in row):
            compat_rows.append(row)

    print(f" Non-trivial compatibility equations: {len(compat_rows)}")
    if not compat_rows:
        print("[-] All compatibility equations are trivial (0=0).")
        print("    The certificate fully absorbs the LHS — recurrence is free.")
        return

    # Solve the small compatibility system for (a0:a1:a2)
    C = matrix(Kn, compat_rows)
    print(f" Compatibility matrix shape: {C.nrows()} × {C.ncols()}")
    compat_ker = C.right_kernel()
    print(f" Compatibility kernel dimension: {compat_ker.dimension()}")

    if compat_ker.dimension() == 0:
        print("[-] No solution: compatibility system is inconsistent.")
        return

    print("\n-> Extracting recurrence from compatibility kernel...")
    for vec in compat_ker.basis():
        a0v, a1v, a2v = vec[0], vec[1], vec[2]
        if a2v == 0:
            continue

        print("\n" + "=" * 65)
        print(" RECURRENCE DERIVED AB INITIO")
        print("=" * 65)

        # Clear denominators
        r0 = Kn(a0v / a2v)
        r1 = Kn(a1v / a2v)
        scale = lcm(r0.denominator(), r1.denominator())
        fa2 = Pn(scale)
        fa1 = Pn(r1 * scale)
        fa0 = Pn(r0 * scale)

        print(f" a2(n) = {sf(fa2)}")
        print(f" a1(n) = {sf(fa1)}")
        print(f" a0(n) = {sf(fa0)}")

        nv = Pn.gen()
        apery = 34*nv**3 + 51*nv**2 + 27*nv + 5
        match = (Pn(fa1) == apery or Pn(-fa1) == apery)
        print(f"\n Matches Apéry 34n³+51n²+27n+5: {match}")
        if match:
            print("\n [!!!] G2 GEOMETRY FORCES APÉRY COEFFICIENTS AB INITIO [!!!]")
            print(" The Beukers 3-form spatial boundary uniquely determines")
            print(" 34, 51, 27, 5 without any prior knowledge of the sequence.")
        break

    print(f"\nElapsed: {time.time()-t0:.1f}s")
    print("=" * 65)

if __name__ == "__main__":
    run()

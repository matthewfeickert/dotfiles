# Global Instructions

## Domain Context

I work in experimental high energy particle physics (HEP) at the intersection of data science and machine learning research. Physics is the primary focus. Assume familiarity with HEP concepts, statistical methods, and particle physics terminology.

## Languages & Tools

- **Primary language:** Python
- **Secondary:** C++ and Fortran (mostly reading/debugging other people's code)
- **Build system:** CMake (used extensively across HEP software)
- **Package/environment management:** Pixi — use Pixi whenever possible. When Pixi is not an option, use uv over pip.
- **Testing:** pytest for Python
- **Containers:** Docker (used locally for development and testing)
- **Documentation:** Markdown-based

## Key Libraries

- **HEP ecosystem:** Scikit-HEP tools — Awkward Array, boost-histogram, pyhf, hist, uproot, vector
- **ML frameworks:** JAX, PyTorch
- **Scientific Python:** NumPy, SciPy

When suggesting solutions, prefer libraries from the Scikit-HEP ecosystem over generic alternatives when applicable (e.g., use Awkward Array for jagged/variable-length data, not nested Python lists).

## Code Style

- Write concise code with clear variable names. Avoid over-abstraction.
- Comments should explain *why*, not *what*. Reference papers, docs, or issues to justify non-obvious decisions (e.g., `# cf. Eq. 3 in arXiv:1007.1727`).
- Follow existing project conventions when editing code I didn't write.
- Python: follow the project's linter/formatter config. If none exists, default to Ruff.
- C++: match the style of the surrounding codebase.

## Scientific Computing Practices

- Preserve numerical stability. Flag operations that risk precision loss (e.g., naive log-sum-exp, catastrophic cancellation).
- Be explicit about array shapes and broadcasting. Add shape comments for non-trivial tensor operations.
- When writing statistical code, cite the method being implemented.
- Prefer vectorized operations over explicit loops.
- Do not silently swallow NaN or Inf — surface them.

## Testing

- Tests should be deterministic. Seed random number generators explicitly.
- Use pytest fixtures and parametrize for systematic coverage.
- For numerical code, use appropriate tolerances with `pytest.approx` or `numpy.testing.assert_allclose` — do not use exact equality for floats.

## Git & Workflow

- Use Conventional Commits format (https://www.conventionalcommits.org/en/v1.0.0/): `<type>[optional scope]: <description>` (e.g., `fix: correct bin edge calculation`, `feat(io): add uproot5 backend`).
- Common types: `feat`, `fix`, `docs`, `test`, `ci`, `build`, `chore`, `refactor`.
- Reference relevant issues or PRs in the commit body or footer when applicable.

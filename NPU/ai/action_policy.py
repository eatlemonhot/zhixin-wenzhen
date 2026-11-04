"""Device-qualified simulation action domain; does not depend on fault truth."""
def policy(family):
    excluded=(22,23,28,29,34,35) if family=='B' else ()
    reserve=(9,16) if family=='B' else (9,34)
    return dict(allowed=[i for i in range(36) if i not in excluded],excluded=list(excluded),reserve=list(reserve),initial=[2,8,14,20,26,32],
                reason='B NE5532: 10k/50-100kHz excluded after development non-periodic response audit; no fault-specific routing' if family=='B' else 'Original A/NE domain unchanged')

import Crypto

let pemKey = """
-----BEGIN EC PRIVATE KEY-----
MHcCAQEEIAbj0ro4TOsOkkvWIDVSuIOP2v5z06YvYFrAbGRRuf/OoAoGCCqGSM49
AwEHoUQDQgAEVyrxWSoegtaBmj4sKFt//U5TE381uTFT44RvN30ujv/4U/Dr7DeX
Jy8ChDiyWQdXem/BcZVWqGkrADMAuXZD7Q==
-----END EC PRIVATE KEY-----
"""

var clearKey: String {
    pemKey
        .replacingOccurrences(of: "-----BEGIN EC PRIVATE KEY-----", with: "")
        .replacingOccurrences(of: "-----END EC PRIVATE KEY-----", with: "")
        .replacingOccurrences(of: "\n", with: "")
}

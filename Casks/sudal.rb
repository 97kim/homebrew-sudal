cask "sudal" do
  version "0.11.9"
  sha256 "db14e539a68eaad99242dbfaecd5a80a08f5a0896be7eee1b13f7623d81e809e"

  url "https://github.com/97kim/sudal/releases/download/v#{version}/sudal-#{version}-arm64.dmg"
  name "Sudal"
  desc "Chat tabs for Claude Code and Codex"
  homepage "https://github.com/97kim/sudal"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "Sudal.app"

  zap trash: [
    "~/Library/Application Support/Sudal",
    "~/Library/Preferences/io.github.97kim.sudal.plist",
    "~/Library/Saved Application State/io.github.97kim.sudal.savedState",
  ]

  caveats <<~CAVEATS
    서명과 공증을 하지 않은 앱이라 처음 열 때 macOS가 막아요.
    시스템 설정 → 개인정보 보호 및 보안에서 "그래도 열기"를 누르거나 다음을 실행하세요.
      xattr -d com.apple.quarantine #{appdir}/Sudal.app
    한 번 허용하면 이후 brew upgrade는 허용을 이어받아요.
  CAVEATS
end

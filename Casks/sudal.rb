cask "sudal" do
  version "0.11.0"
  sha256 "fc56b4fc5cfe24ab6f6002cb16d460b0314bf39505aedec39546c3592dc0924a"

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

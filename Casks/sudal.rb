cask "sudal" do
  version "0.24.2"
  sha256 "0a861e16b8abb4c14f66f0c6f4b940e5227ae79883ea0ff9089ebe389c630443"

  url "https://github.com/97kim/sudal/releases/download/v#{version}/sudal-#{version}-arm64.dmg"
  name "Sudal"
  desc "Desktop workspace for coding agents"
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
    시스템 설정 → 개인정보 보호 및 보안에서 허용하거나 다음을 실행하세요.
      xattr -d com.apple.quarantine #{appdir}/Sudal.app
  CAVEATS
end

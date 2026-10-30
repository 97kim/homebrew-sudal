cask "sudal" do
  version "0.15.3"
  sha256 "542aff4dedb49d35057b4e8542b55a3cdbf4fe3e92032ec8b148c7bbcd2ab4b2"

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

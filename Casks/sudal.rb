cask "sudal" do
  version "0.20.2"
  sha256 "2ca69905222feaca6ce8495fe8e0f430eab84e4e161c6412e6f248b02933dbb7"

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

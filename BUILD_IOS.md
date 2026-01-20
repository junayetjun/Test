## Step 1: Use GitHub Actions (Updated for IPA)

I have updated the workflow in `.github/workflows/ios-build.yml` to target the **IPA** format.

1. **Push your code to GitHub.**
2. Go to your repository on GitHub -> **Actions**.
3. Run the **iOS Build** workflow.
4. Once finished, you can download the `ios-ipa-build` artifact.

> [!CAUTION]
> GitHub Actions with `--no-codesign` may produce a folder or a basic `.ipa`. Most physical iPhones require a **signed** IPA.

## Step 2: Professional IPA with Codemagic (Recommended)

For a real `.ipa` file that you can install (even for testing), I have added a `codemagic.yaml` file.

1. Sign up/in at [Codemagic.io](https://codemagic.io).
2. Connect your GitHub repository.
3. Codemagic will detect the `codemagic.yaml` I created.
4. If you have an **Apple Developer Account**, you can set up "Automatic Code Signing" in the Codemagic UI.
5. Hit "Start Build" to get your signed IPA.

> [!NOTE]
> This build is **un-signed**. It cannot be installed on a physical iPhone yet, but it proves the code compiles and builds correctly for iOS.

## Step 2: Full Signing (Required for App Store/Physical Devices)

To generate a signed `.ipa` that you can install:

1. You need an **Apple Developer Account**.
2. You need to set up **App Store Connect** and obtain:
   - Certificate (.p12)
   - Provisioning Profile (.mobileprovision)
3. You can use **Codemagic.io** (Recommended) for a more user-friendly experience than GitHub Actions for signing.

## Step 3: Preparation I've already done for you

- Updated the **Bundle Identifier** to `com.tunetornament.app`.
- Enabled **File Sharing** so you can see exported CSV/Excel files in the iOS "Files" app.
- Added **Apple Music/Media Library** permission (`NSAppleMusicUsageDescription`).
- Configured a **Podfile** for CI/CD compatibility.

---

**Need help with specific signing steps?** Just ask!

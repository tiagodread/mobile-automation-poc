import { byValueKey } from 'appium-flutter-finder'

describe('My Login application', () => {
    it('should login with valid credentials', async () => {
        const emailField = byValueKey('login-email')
        const passField = byValueKey('login-password')
        const loginButton = byValueKey('login-access')
        const loginSuccessMessage = byValueKey('snack-bar-ok')

        await driver.elementSendKeys(emailField, 'example@example.com')
        await driver.elementSendKeys(passField, 'Mudar@123')
        await driver.elementClick(loginButton)
        expect(await driver.getElementText(loginSuccessMessage)).toBe('Login success')
    })
})


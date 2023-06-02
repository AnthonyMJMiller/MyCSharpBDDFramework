using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using OpenQA.Selenium;

namespace AMillersCSharpBDDFramework.Pages
{
    public class GooglePage
    {
        private IWebDriver driver;

        public GooglePage(IWebDriver driver)
        {
            this.driver = driver;
        }

        By searchBox = By.Id("APjFqb");

        public string GetTitle()
        {
            return driver.Title;

        }
        public void ClickSearchBox()
        {
            driver.FindElement(searchBox).Click();
        }

        public void EnterText(string text)
        {
            driver.FindElement(searchBox).SendKeys(text);
        }
    }
}

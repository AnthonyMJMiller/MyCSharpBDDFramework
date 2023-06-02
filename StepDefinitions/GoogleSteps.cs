using AMillersCSharpBDDFramework.Pages;
using NUnit.Framework;
using OpenQA.Selenium;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AMillersCSharpBDDFramework.StepDefinitions
{
    [Binding]
    public sealed class GoogleSteps
    {
        private IWebDriver driver;
        GooglePage googlePage;
        public GoogleSteps(IWebDriver driver) 
        {
            this.driver = driver;
        }

        [Given(@"I am on Google")]
        public void GivenImOnGoogle()
        {
            googlePage = new GooglePage(driver);

            driver.Url = "https://www.google.com/";
            Thread.Sleep(1000);
            Assert.AreEqual("Google", googlePage.GetTitle());
            Thread.Sleep(1000);
        }

        [When(@"I click on the search box")]
        public void ClickOnTheSearchBox()
        {
            googlePage.ClickSearchBox();
            Thread.Sleep(1000);
        }

        [Then(@"I verify that I can type alphanumeric (.*)")]
        public void TypeInTheSearchBox(string characters) 
        {
            googlePage.EnterText(characters);
            Thread.Sleep(1000);
        }
    }
}

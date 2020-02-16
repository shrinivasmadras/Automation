import os
import selenium
from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time
import keyboard
from bs4 import BeautifulSoup
import pyautogui
import numpy as np

#chrome driver path
chromedriver = ""
#profile name of firend
friends_profile_name = ""
#account username
username_1 = ''
#account password
password_1 = ''

chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument("start-maximized")
chrome_options.add_argument("--incognito")
chrome_options.add_argument('--ignore-certificate-errors')
chrome_options.add_argument("--test-type")
#chrome_options.add_experimental_option("excludeSwitches", ['enable-automation'])
chrome_options.add_argument("--disable-extensions")
time.sleep(9)
driver = webdriver.Chrome(chromedriver,options=chrome_options)
driver.delete_all_cookies()
driver.get("https://www.instagram.com/")

time.sleep(10)
pyautogui.moveTo(1880, 140)
time.sleep(10)
pyautogui.click(1880, 140)

driver.execute_script("window.scrollTo(0, 60)")
time.sleep(4)

driver.find_element_by_link_text("Log in").click()
time.sleep(4)

username = driver.find_element_by_name('username')
username.send_keys(username_1)

password = driver.find_element_by_name('password')
password.send_keys(password_1)

driver.find_element_by_xpath("//button[contains(.,'Log In')]").click()
time.sleep(4)
driver.find_element_by_xpath("//button[contains(.,'Not Now')]").click()
time.sleep(4)

search = driver.find_element_by_xpath("//*[@placeholder='Search']")
search.send_keys(friends_profile_name)
time.sleep(4)

navigate_to_profile = driver.find_element_by_xpath("//a[contains(@href,'" + friends_profile_name + "')]")
driver.execute_script("arguments[0].click();", navigate_to_profile)
time.sleep(3)

my_array = []
for elem in driver.find_elements_by_xpath('.//span[@class = "g47SY "]'):
        print(elem.text)
        my_array.append(elem.text)
        
#first_elem = my_array[0]
#first_elem = int(first_elem)
#print(first_elem)

#with open('myfile.txt', 'w') as fp: 
    #for elem in driver.find_elements_by_xpath('.//span[@class = "g47SY "]'):
      #  print(elem.text, file=fp)
        
#with open('myfile.txt', 'r') as fp:
       # first_line = fp.readline()
        
#first_line = int(first_line)
#print(first_line)

time.sleep(4)
driver.execute_script("window.scrollTo(0, 100)")

first_image_open = driver.find_element_by_xpath('//div[contains(@class,"_9AhH0")]')
time.sleep(4)
driver.execute_script("arguments[0].click();", first_image_open)
time.sleep(4)
driver.execute_script("arguments[0].click();", first_image_open)

def like_unlike_bot():
    count = 0
    first_elem = my_array[0]
    first_elem = int(first_elem)
    while count < first_elem:
        FILL_VALUE = driver.find_elements_by_css_selector("[fill='#262626']")
        time.sleep(4)
        length = len(FILL_VALUE)
        print(length)
        time.sleep(4)
        if count == first_elem:
            break
        else:
            if length > 7:
                time.sleep(4)
                driver.find_element_by_xpath('//button[contains(@class,"wpO6b")]').click()
                time.sleep(9)
                keyboard.press_and_release('right')
            else:
                time.sleep(4)
                keyboard.press_and_release('right')
                time.sleep(4)
            
            count += 1

like_unlike_bot()
    
        
    
    
    

package com.uiflows

import java.text.SimpleDateFormat
import org.apache.shiro.SecurityUtils
import java.text.DecimalFormat


class UtilitiesService {

    static transactional = true
	
    def serviceMethod() {

    }

	def getRandomNumber(high, low){
		def random = new Random()
		return random.nextInt(high-low+1)+low
	}

	
	def getTodaysDate(){
		def date = new Date()
		
		date.clearTime()
		return date
	}
	
	
	def getFormattedDateNoTimeOption1(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("dd MMM yyyy");
		return formatter.format(date)
	}
	
	def getFormattedDateNoTimeOption2(Date date){
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		return formatter.format(date)
	}
	

	def getSupportLink(){
		return '<a href="mailto:uiflows@gmail.com" title="Email Support at uiflows@gmail.com">uiflows@gmail.com</a>'
	}
	
	
	def Map reverseSortMap(Map unsortedMap) {

	    // 3. Reverse Sort by a particular field of Value(Date Of Birth):
	    Comparator comparator = [compare: {a , b -> unsortedMap.get(b).value.compareTo(unsortedMap.get(a).value)  }] as Comparator

	    Map sortedMap = new TreeMap(comparator)
	    sortedMap.putAll(unsortedMap)

	    return sortedMap
	}
	
}

//*****************DONE*****************
package com.upgrad.blog.exceptions;

/**
 * TODO: 3.1. Convert this class to a custom Exception class.
 * TODO: 3.2. Provide a constructor which accepts a custom message as input
 * parameter and passes it to its base class.
 */
public class EmailNotValidException
	//*****************START*****************Solution 3.1 + 3.2*****************
	extends Exception {

    /**
     *
     * @param s
     */
    public EmailNotValidException(String s) {

        super(s);
    }
    //*****************END*****************Solution 3.1 + 3.2*****************
    
//    public static void main(String[] args) {
//		try {
//			throw new EmailNotValidException("Custom Message");
//		} catch (EmailNotValidException e) {
//			System.out.println(e.getMessage());
//		}
//		
//		/**
//		 * Your output should look like this.
//		 * Custom Message
//		 */
//	}
}

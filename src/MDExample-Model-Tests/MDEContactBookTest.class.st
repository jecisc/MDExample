Class {
	#name : #MDEContactBookTest,
	#superclass : #TestCase,
	#instVars : [
		'contactBook'
	],
	#category : #'MDExample-Model-Tests'
}

{ #category : #running }
MDEContactBookTest >> setUp [
	super setUp.
	contactBook := MDEContactBook new
]

{ #category : #tests }
MDEContactBookTest >> testAddContact [ 
	contactBook addContact: (MDEContact name: 'toto' number: '0606060606').
	self assert: contactBook numberOfContacts equals: 1.
	self assert: contactBook contacts anyOne name equals: 'toto'
]

{ #category : #tests }
MDEContactBookTest >> testConnotHaveDuplicatedContacts [
	contactBook addContact: (MDEContact name: 'toto' number: '0606060606').
	self should: [ contactBook addContact: (MDEContact name: 'toto' number: '0606060606') ] raise: MDEDuplicatedContact
]

{ #category : #tests }
MDEContactBookTest >> testRemoveContact [
	contactBook addContact: (MDEContact name: 'toto' number: '0606060606').
	self assert: contactBook numberOfContacts equals: 1.
	contactBook removeContact: (MDEContact name: 'toto' number: '0606060606').
	self assert: contactBook numberOfContacts equals: 0
]

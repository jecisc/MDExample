Class {
	#name : #MDEContactTest,
	#superclass : #TestCase,
	#instVars : [
		'contact'
	],
	#category : #'MDExample-Model-Tests'
}

{ #category : #tests }
MDEContactTest >> testEquals [
	contact := MDEContact name: 'toto' number: '0606060606'.
	self assert: contact equals: (MDEContact name: 'toto' number: '0606060606').
	self assert: contact hash equals: (MDEContact name: 'toto' number: '0606060606') hash.
	self deny: contact equals: (MDEContact name: 'tot' number: '0606060606').
	self deny: contact hash equals: (MDEContact name: 'tot' number: '0606060606') hash
]

{ #category : #tests }
MDEContactTest >> testNameNumber [
	contact := MDEContact name: 'toto' number: '0606060606'.
	self assert: contact name equals: 'toto'.
	self assert: contact number equals: '0606060606'
]

Class {
	#name : #MDEContactBook,
	#superclass : #Object,
	#instVars : [
		'contacts'
	],
	#category : #'MDExample-Model-Core'
}

{ #category : #adding }
MDEContactBook >> addContact: aMDEContact [
	(self contacts includes: aMDEContact) ifTrue: [ MDEDuplicatedContact signal ].
	self contacts add: aMDEContact
]

{ #category : #accessing }
MDEContactBook >> contacts [
	^ contacts
]

{ #category : #initialization }
MDEContactBook >> initialize [
	super initialize.
	contacts := OrderedCollection new
]

{ #category : #accessing }
MDEContactBook >> numberOfContacts [
	^ self contacts size
]

{ #category : #removal }
MDEContactBook >> removeContact: aMDEContact [ 
	self contacts remove: aMDEContact ifAbsent: [ "Do nothing" ]
]

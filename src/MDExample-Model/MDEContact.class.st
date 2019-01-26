Class {
	#name : #MDEContact,
	#superclass : #Object,
	#instVars : [
		'name',
		'number'
	],
	#category : #'MDExample-Model-Core'
}

{ #category : #'instance creation' }
MDEContact class >> name: aString number: aString2 [
	^ self new
		name: aString;
		number: aString2;
		yourself
]

{ #category : #comparing }
MDEContact >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ name = anObject name and: [ number = anObject number ]
]

{ #category : #comparing }
MDEContact >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ name hash bitXor: number hash
]

{ #category : #accessing }
MDEContact >> name [
	^ name
]

{ #category : #accessing }
MDEContact >> name: aString [ 
	name := aString
]

{ #category : #accessing }
MDEContact >> number [
	^ number
]

{ #category : #accessing }
MDEContact >> number: aString [ 
	number := aString
]

{ #category : #printing }
MDEContact >> printOn: aStream [
	super printOn: aStream.

	aStream << '(' << self name << ' - ' << self number << ')'
]

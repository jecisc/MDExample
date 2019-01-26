Class {
	#name : #MDEPage,
	#superclass : #MDEComponent,
	#category : #'MDExample-WebApplication'
}

{ #category : #testing }
MDEPage class >> isAbstract [
	^ self = MDEPage
]

{ #category : #testing }
MDEPage class >> pageName [
	^ self subclassResponsibility
]

{ #category : #testing }
MDEPage class >> pagesToDisplay [
	^ (self allSubclasses reject: #isAbstract) sorted: [ :a :b | a priority < b priority ]
]

{ #category : #testing }
MDEPage class >> priority [
	^ self subclassResponsibility
]

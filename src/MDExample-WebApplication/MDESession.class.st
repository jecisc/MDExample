Class {
	#name : #MDESession,
	#superclass : #WASession,
	#instVars : [
		'rootComponent'
	],
	#category : #'MDExample-WebApplication'
}

{ #category : #accessing }
MDESession >> rootComponent [
	^ rootComponent
]

{ #category : #accessing }
MDESession >> rootComponent: anObject [
	rootComponent := anObject
]

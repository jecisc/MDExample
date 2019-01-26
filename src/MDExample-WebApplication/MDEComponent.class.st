Class {
	#name : #MDEComponent,
	#superclass : #WAComponent,
	#category : #'MDExample-WebApplication'
}

{ #category : #accessing }
MDEComponent >> display: aComponentInstance [
	"Set a component instance as the component to display by the root component."

	self rootComponent componentToDisplay: aComponentInstance
]

{ #category : #accessing }
MDEComponent >> displayInstanceOf: aComponentClass [
	"Set a component class as the component to display by the root component."

	self rootComponent displayInstanceOf: aComponentClass
]

{ #category : #accessing }
MDEComponent >> rootComponent [
	^ self session rootComponent
]

Class {
	#name : #MDEContactsPage,
	#superclass : #MDEPage,
	#category : #'MDExample-WebApplication'
}

{ #category : #testing }
MDEContactsPage class >> pageName [
	^ 'Contacts'
]

{ #category : #testing }
MDEContactsPage class >> priority [
	^ 1
]

{ #category : #rendering }
MDEContactsPage >> renderContentOn: html [
	html text: 'todo'
]

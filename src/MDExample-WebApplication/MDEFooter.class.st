Class {
	#name : #MDEFooter,
	#superclass : #MDEComponent,
	#category : #'MDExample-WebApplication'
}

{ #category : #rendering }
MDEFooter >> renderContentOn: html [
	html mdlMiniFooter: [ html mdlMiniFooterLeftSection: [ html mdlMiniFooterRightSection: [ html mdlMiniFooterLinkList: [ html listItem: '© 2019 - Cyril Ferlicot' ] ] ] ]
]

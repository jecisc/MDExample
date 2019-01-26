Class {
	#name : #MDEHeader,
	#superclass : #MDEComponent,
	#instVars : [
		'activeTab'
	],
	#category : #'MDExample-WebApplication'
}

{ #category : #accessing }
MDEHeader >> possiblePages [
	^ MDEPage pagesToDisplay
]

{ #category : #rendering }
MDEHeader >> renderContentOn: html [
	html mdlLayoutHeader
		waterfall;
		with: [ html
				mdlLayoutHeaderRow: [ html mdlNavigationLink
						callback: [ "Just refresh" ];
						with: [ html mdlLayoutTitle: 'Contact book' ] ].
			html
				mdlLayoutTabBar: [ self possiblePages
						do: [ :aClass | 
							html mdlLayoutTab
								callback: [ self displayInstanceOf: aClass ];
								isActiveIf: aClass = self rootComponent componentToDisplay class;
								with: aClass pageName ] ] ]
]

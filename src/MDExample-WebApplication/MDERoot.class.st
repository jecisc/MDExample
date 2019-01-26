Class {
	#name : #MDERoot,
	#superclass : #MDEComponent,
	#instVars : [
		'header',
		'footer',
		'componentToDisplay',
		'componentInstances'
	],
	#category : #'MDExample-WebApplication'
}

{ #category : #'class initialization' }
MDERoot class >> applicationName [
	^ 'contactBook'
]

{ #category : #testing }
MDERoot class >> canBeRoot [
	^ true
]

{ #category : #'class initialization' }
MDERoot class >> initialize [
	self environment at: #WADevelopmentConfiguration ifPresent: [ :class | WAAdmin applicationDefaults removeParent: class instance ].
	^ (WAAdmin register: self asApplicationAt: self applicationName)
		preferenceAt: #sessionClass put: MDESession;
		addLibrary: JQDeploymentLibrary;
		addLibrary: MDLLibrary;
		"addLibrary: MDLDemoLibrary;"
			yourself
]

{ #category : #'class initialization' }
MDERoot class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item: #'Open contact book')
		iconName: #nautilus;
		order: 20;
		action: [ self open ].
]

{ #category : #'class initialization' }
MDERoot class >> open [
	<script>
	| port |
	WAServerManager default adaptors
		ifEmpty: [ (ZnZincServerAdaptor port: (port := 8085)) start ]
		ifNotEmpty: [ :adaptors | adaptors detect: #isRunning ifFound: [ :anAdaptor | port := anAdaptor server port ] ifNone: [ (ZnZincServerAdaptor port: (port := 8085)) start ] ].
	WebBrowser openOn: 'http://localhost:' , port asString , '/' , self applicationName
]

{ #category : #accessing }
MDERoot >> componentInstances [
	^ componentInstances
]

{ #category : #accessing }
MDERoot >> componentInstances: anObject [
	componentInstances := anObject
]

{ #category : #accessing }
MDERoot >> componentToDisplay [
	^ componentToDisplay
]

{ #category : #accessing }
MDERoot >> componentToDisplay: anObject [
	componentToDisplay := anObject
]

{ #category : #accessing }
MDERoot >> defaultFooter [
	^ MDEFooter new
]

{ #category : #accessing }
MDERoot >> defaultHeader [
	^ MDEHeader new
]

{ #category : #initialization }
MDERoot >> displayInstanceOf: aComponentClass [
	self componentToDisplay: (self componentInstances at: aComponentClass ifAbsentPut: [ aComponentClass new ])
]

{ #category : #accessing }
MDERoot >> footer [
	^ footer
]

{ #category : #accessing }
MDERoot >> footer: anObject [
	footer := anObject
]

{ #category : #accessing }
MDERoot >> header [
	^ header
]

{ #category : #accessing }
MDERoot >> header: anObject [
	header := anObject
]

{ #category : #initialization }
MDERoot >> initialize [
	super initialize.
	self header: self defaultHeader.
	self footer: self defaultFooter.
	self session rootComponent: self.
	self componentInstances: Dictionary new.
	self displayInstanceOf: MDEPage pagesToDisplay first
]

{ #category : #hooks }
MDERoot >> renderContentOn: html [
	html
		mdlLayout: [ html render: self header.
			html mdlLayoutContent
				class: 'mdl-color-text--grey-600';
				with: [ html mdlGrid
						noSpacing;
						with: [ html mdlCell
								class: 'mdl-components';
								size: 12;
								with: [ html render: self componentToDisplay ] ].
					html render: self footer ] ]
]

{ #category : #hooks }
MDERoot >> style [
	^ '.mdl-pagination__current{
        box-shadow: inset 0px -4px 0px 0px #E91E63 !important;
    }'
]

{ #category : #TODO }
MDERoot >> todo [
	self flag: #todo.
	"
	* Contacts 
	* Add contact
	* Ajax
	* URL
	* FileLibrary
	* MDL
	"
]

{ #category : #updating }
MDERoot >> updateRoot: anHtmlRoot [
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'Contact book'.
	anHtmlRoot meta
		attributeAt: 'name' put: 'viewport';
		content: 'width=device-width, initial-scale=1'.
	anHtmlRoot stylesheet url: (WAUrl absolute: 'https://storage.googleapis.com/code.getmdl.io/1.3.0/material.deep_purple-pink.min.css')
]

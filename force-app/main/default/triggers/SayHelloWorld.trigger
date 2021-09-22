trigger SayHelloWorld on Account (before insert) {
	System.debug('Hello, World!');
}
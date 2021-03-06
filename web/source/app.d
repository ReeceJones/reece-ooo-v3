import vibe.d;

import mood.vibe;

shared static this()
{
	auto router = new URLRouter;

	router.get("/", moodRender!"index.html");
    
    router.get("*", serveStaticFiles("public/"));

	auto settings = new HTTPServerSettings;
	settings.port = 9001;
	settings.bindAddresses = ["::1", "0.0.0.0"];

	listenHTTP(settings, router);
}

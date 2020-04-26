<?php

namespace App\Tests\Functional\Controller;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class StatusControllerTest extends WebTestCase
{
    public function testStatusOk()
    {
        $client = static::createClient();
        $client->request('GET', '/status');

        $this->assertResponseIsSuccessful();
        $response = $client->getResponse();
        $this->assertEquals('{"status":"ok"}', $response->getContent());
    }
}

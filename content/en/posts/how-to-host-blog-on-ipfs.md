+++
date = '2025-02-17T21:47:27+09:00'
draft = false
title = 'How to host a blog on IPFS'
+++

## Introduction

As you may know, this blog is hosted on IPFS, a decentralized file system.

In this post, I'll guide you through how to create a blog almost for free. (you have to pay a few bucks to get a domain name if you need it though)

## Prerequisites

- A little bit of programming skills
- Familiarity with the command line

## IPFS

First, let's talk a little bit about IPFS.

What is IPFS? IPFS stands for InterPlanetary File System.

You can upload files to IPFS and share them with others. Or you can see files uploaded by others.

IPFS has nodes all over the world. Each node stores a copy of the file. So even if one node goes down, you can still access the file from another node.

You can run your own IPFS node on your computer if you want. For further information, please refer to the [official website](https://ipfs.io/).

## A static site generator

A static site generator will make it easier to generate files and publish them as a blog.

I use Hugo for this blog, but you can use any static site generator you like. I won't dive into the details of how to use Hugo in this post.

Of cource, you can write HTML files by hand if you want. All we need is HTML/CSS/JS files to build a blog.

## Publishing to IPFS

After you generate files, it's time to publish them to IPFS.

If you use a static site generator, the files to be published are usually put in the some directory.

In the case of Hugo, you can find them in the `public` directory.

To publish files to IPFS, first, you need to install IPFS on your computer.

IPFS Desktop App is the easiest way to interact with IPFS. Follow the instructions on the [official document](https://docs.ipfs.tech/install/ipfs-desktop/) to install it.

After installing IPFS, you can publish files to IPFS by running the following command:

```bash
ipfs add -r <directory>
```

`-r` option means recursive. It will add all files in the directory.

You will get a hash after running the command. This hash is the address of the directory you published.

Or you can get a hash without publishing a directory by running the following command:

```bash
ipfs add -Qr --only-hash <directory>
```

You may also wanto to pin the files to make sure they are always available. You can pin files by running the following command:

```bash
ipfs pin add <hash>
```

`<hash>` is the hash of the directory you published.

Now you'll be able to access your blog by visiting `https://ipfs.io/ipfs/<hash>`.

## A domain name(Optional)

If you want to use a domain name for your blog, you can get one using ENS or DNSLink.

I use ENS for this blog. It's cheap and easy to use. Check out the [documentation](https://docs.ipfs.tech/how-to/websites-on-ipfs/link-a-domain) on how to get a domain name.

After getting a domain name, you will need to link your blog to the domain name.

To identify where your blog resides, you need the hash of the directory you published(CID) and you can link it to the domain name as the documentation above mentions.

But the hash changes every time you publish the directory and it's tedious to update the CID every time you update your blog's contents and publish the directory.

To solve this problem, [InterPlanetary Name System (IPNS)](https://docs.ipfs.tech/concepts/ipns) is there for you.

By using IPNS, you can link your domain name to the latest hash of the directory you published so no need to update the CID every time you update your blog's contents.

To use IPNS, you need to run the following command:

```bash
ipfs name publish <hash>
```
After you run this command, you will get another hash. This hash is the address of your blog and you can use it to set up your domain name to point to your blog.

## Pinning service(Optional)

If you want to make sure your blog is always available, you can use a pinning service like [Pinata](https://pinata.cloud/).

Without a pinning service, your blog might be deleted from IPFS nodes if you're not running your own node and no one accesses it for a while.

You may use it for free up to a certain amount of storage.

## Conclusion

That's it! You've learned how to host a blog on IPFS.

I hope this post helps you create your own blog on IPFS.

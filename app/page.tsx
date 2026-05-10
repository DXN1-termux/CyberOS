import React from 'react';
import Link from 'next/link';
import { Terminal, Shield, Zap, Globe, PackageOpen } from 'lucide-react';
import { motion } from 'framer-motion';

export default function CyberOSLanding() {
  return (
    <div className="min-h-screen bg-black text-gray-100 font-sans selection:bg-cyan-500/30">
      
      {/* Navbar */}
      <nav className="border-b border-gray-800 bg-black/50 backdrop-blur-md sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
          <div className="flex items-center gap-2">
            <Shield className="w-6 h-6 text-cyan-400" />
            <span className="font-bold text-xl tracking-tight text-white">CyberOS</span>
          </div>
          <div className="flex gap-6 text-sm font-medium text-gray-400">
            <Link href="#features" className="hover:text-white transition-colors">Features</Link>
            <Link href="#installation" className="hover:text-white transition-colors">Installation</Link>
            <Link href="#tools" className="hover:text-white transition-colors">Included Tools</Link>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="pt-32 pb-20 px-6 relative overflow-hidden">
        {/* Abstract Background */}
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[800px] h-[800px] bg-cyan-900/20 rounded-full blur-[120px] pointer-events-none" />
        
        <div className="max-w-4xl mx-auto text-center relative z-10">
          <div className="inline-flex items-center gap-2 px-3 py-1 rounded-full bg-gray-900 border border-gray-800 text-sm text-cyan-400 font-mono mb-8">
            <Terminal className="w-4 h-4" />
            <span>v1.0 Beta</span>
          </div>
          <h1 className="text-5xl md:text-7xl font-extrabold tracking-tight text-white mb-8">
            The zero-hassle VNC distro <br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 to-blue-500">
              for bug bounty hunters.
            </span>
          </h1>
          <p className="text-xl text-gray-400 mb-12 max-w-2xl mx-auto leading-relaxed">
            Stop wasting hours configuring tools. Clone the repo, launch the port, and get a fully-loaded XFCE desktop with Burp Suite, Firefox, and Wireshark ready to go.
          </p>
          
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
            <a href="#installation" className="px-8 py-4 bg-white text-black font-semibold rounded-lg hover:bg-gray-200 transition-colors w-full sm:w-auto text-center flex items-center justify-center gap-2">
              <PackageOpen className="w-5 h-5" />
              Get CyberOS
            </a>
            <a href="https://github.com/DXN1-termux/CyberOS" target="_blank" rel="noopener noreferrer" className="px-8 py-4 bg-gray-900 text-white font-semibold rounded-lg hover:bg-gray-800 border border-gray-800 transition-colors w-full sm:w-auto text-center flex items-center justify-center gap-2">
              <Globe className="w-5 h-5" />
              View on GitHub
            </a>
          </div>
        </div>
      </section>

      {/* Code Snippet / Demo Section */}
      <section className="py-20 px-6 bg-gray-950/50">
        <div className="max-w-4xl mx-auto">
          <div className="rounded-xl overflow-hidden border border-gray-800 bg-black/60 shadow-2xl backdrop-blur-xl">
            <div className="flex items-center gap-2 px-4 py-3 border-b border-gray-800 bg-gray-900/50">
              <div className="w-3 h-3 rounded-full bg-red-500" />
              <div className="w-3 h-3 rounded-full bg-yellow-500" />
              <div className="w-3 h-3 rounded-full bg-green-500" />
              <div className="text-xs text-gray-500 font-mono ml-4">bash</div>
            </div>
            <div className="p-6 font-mono text-sm leading-loose">
              <div className="text-gray-400 flex items-center gap-4">
                <span className="text-cyan-500 select-none">$</span>
                <span className="text-white">git clone https://github.com/DXN1-termux/CyberOS.git</span>
              </div>
              <div className="text-gray-400 flex items-center gap-4 mt-2">
                <span className="text-cyan-500 select-none">$</span>
                <span className="text-white">cd CyberOS && chmod +x setup.sh CyberOS</span>
              </div>
              <div className="text-gray-400 flex items-center gap-4 mt-2">
                <span className="text-cyan-500 select-none">$</span>
                <span className="text-white">./setup.sh</span>
              </div>
              <div className="text-gray-500 mt-2 text-xs">
                [+] Setting up CyberOS environment...<br/>
                [+] Installing XFCE, TightVNC, and dependencies...<br/>
                [+] Downloading Burp Suite Community Edition...
              </div>
              <div className="text-gray-400 flex items-center gap-4 mt-4">
                <span className="text-cyan-500 select-none">$</span>
                <span className="text-white">./CyberOS 5901</span>
              </div>
              <div className="text-green-400 mt-2 text-xs">
                [+] BOOM! CyberOS is live.<br/>
                [+] Connect your VNC viewer to &lt;your-ip&gt;:5901
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* Features Grid */}
      <section id="features" className="py-24 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-16">
          <h2 className="text-3xl font-bold tracking-tight text-white mb-4">Optimized for Security</h2>
          <p className="text-gray-400 bg-gray-900/50 inline-block px-4 py-2 rounded-lg border border-gray-800">Everything you need, nothing you don't.</p>
        </div>

        <div className="grid md:grid-cols-3 gap-6">
          {/* Feature 1 */}
          <div className="bg-gray-900/50 border border-gray-800 p-8 rounded-2xl hover:border-gray-700 transition-colors">
            <Zap className="w-10 h-10 text-cyan-400 mb-6" />
            <h3 className="text-xl font-bold text-white mb-3">Instant Port Launch</h3>
            <p className="text-gray-400 leading-relaxed text-sm">
              Type `CyberOS [port]` in your terminal and boom. It calculates the correct display and launches ready for any VNC viewer.
            </p>
          </div>

          {/* Feature 2 */}
          <div className="bg-gray-900/50 border border-gray-800 p-8 rounded-2xl hover:border-gray-700 transition-colors">
            <Shield className="w-10 h-10 text-cyan-400 mb-6" />
            <h3 className="text-xl font-bold text-white mb-3">The Golden Arsenal</h3>
            <p className="text-gray-400 leading-relaxed text-sm">
              Forget manual installations. Burp Suite, Firefox (properly proxied), and Wireshark are included out of the box.
            </p>
          </div>

          {/* Feature 3 */}
          <div className="bg-gray-900/50 border border-gray-800 p-8 rounded-2xl hover:border-gray-700 transition-colors">
            <Terminal className="w-10 h-10 text-cyan-400 mb-6" />
            <h3 className="text-xl font-bold text-white mb-3">XFCE Excellence</h3>
            <p className="text-gray-400 leading-relaxed text-sm">
              A meticulously configured XFCE desktop environment that runs smoothly over remote connections, even on low bandwidth.
            </p>
          </div>
        </div>
      </section>

      {/* Footer */}
      <footer className="border-t border-gray-800 bg-black py-12 px-6">
        <div className="max-w-7xl mx-auto flex flex-col md:flex-row justify-between items-center text-sm">
          <div className="flex items-center gap-2 mb-4 md:mb-0">
            <Shield className="w-5 h-5 text-gray-500" />
            <span className="font-semibold text-gray-400">CyberOS</span>
          </div>
          <p className="text-gray-600">
            Built for educational and authorized security testing purposes only.
          </p>
        </div>
      </footer>

    </div>
  );
}

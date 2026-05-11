import React from 'react';
import Link from 'next/link';
import { Terminal, Shield, Zap, Globe, PackageOpen, Layers, Target, Crosshair, Network, Cpu } from 'lucide-react';

export default function CyberOSLanding() {
  return (
    <div className="min-h-screen bg-[#050505] text-gray-100 font-sans selection:bg-cyan-500/30">
      
      {/* Navbar */}
      <nav className="border-b border-white/5 bg-black/50 backdrop-blur-md sticky top-0 z-50">
        <div className="max-w-7xl mx-auto px-6 h-16 flex items-center justify-between">
          <div className="flex items-center gap-3">
            <div className="relative flex items-center justify-center w-8 h-8 rounded-lg bg-gradient-to-br from-cyan-500/20 to-blue-500/20 border border-cyan-500/30">
              <Shield className="w-4 h-4 text-cyan-400" />
            </div>
            <span className="font-bold text-xl tracking-tight text-white shadow-sm">Cyber<span className="text-cyan-400">OS</span></span>
          </div>
          <div className="hidden md:flex gap-8 text-sm font-medium text-gray-400">
            <Link href="#features" className="hover:text-cyan-400 transition-colors">Architecture</Link>
            <Link href="#tools" className="hover:text-cyan-400 transition-colors">Arsenal</Link>
            <Link href="#installation" className="hover:text-cyan-400 transition-colors">Deployment</Link>
          </div>
        </div>
      </nav>

      {/* Hero Section */}
      <section className="pt-32 pb-24 px-6 relative overflow-hidden">
        {/* Deep Tech Grid Background */}
        <div className="absolute inset-0 bg-[url('https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?auto=format&fit=crop&q=80&w=1920&h=1080')] bg-cover bg-center opacity-10 mix-blend-color-dodge pointer-events-none" />
        <div className="absolute inset-0 bg-gradient-to-b from-[#050505]/50 via-[#050505]/80 to-[#050505] pointer-events-none" />
        
        <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[600px] h-[600px] bg-cyan-600/20 rounded-full blur-[150px] pointer-events-none" />
        
        <div className="max-w-5xl mx-auto text-center relative z-10">
          <div className="inline-flex items-center gap-2 px-3 py-1.5 rounded-full bg-cyan-950/30 border border-cyan-800/50 text-xs font-semibold text-cyan-400 font-mono mb-8 uppercase tracking-widest shadow-[0_0_15px_rgba(34,211,238,0.1)]">
            <span className="w-2 h-2 rounded-full bg-cyan-400 animate-pulse" />
            Advanced Penetration Testing Distro
          </div>
          <h1 className="text-5xl md:text-8xl font-black tracking-tighter text-white mb-8 leading-[1.1]">
            Weaponize Your <br/>
            <span className="text-transparent bg-clip-text bg-gradient-to-r from-cyan-400 via-blue-500 to-indigo-500 drop-shadow-sm">
              Workflow.
            </span>
          </h1>
          <p className="text-xl text-gray-400 mb-12 max-w-3xl mx-auto leading-relaxed border-l-2 border-cyan-500/20 pl-6 text-left md:text-center md:border-none md:pl-0">
            A highly sophisticated, customized XFCE Linux distribution shipped via VNC. Loaded with a massive deck of advanced security tools, custom cyberpunk wallpapers, and zero configuration bloat.
          </p>
          
          <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
            <a href="#installation" className="group px-8 py-4 bg-cyan-500 text-black font-bold rounded-lg hover:bg-cyan-400 transition-all w-full sm:w-auto text-center flex items-center justify-center gap-2 shadow-[0_0_30px_rgba(34,211,238,0.3)] hover:shadow-[0_0_40px_rgba(34,211,238,0.5)]">
              <Terminal className="w-5 h-5 group-hover:-translate-y-0.5 transition-transform" />
              Initialize CyberOS
            </a>
            <a href="https://github.com/DXN1-termux/CyberOS" target="_blank" rel="noopener noreferrer" className="group px-8 py-4 bg-white/5 text-white font-semibold rounded-lg hover:bg-white/10 border border-white/10 transition-all w-full sm:w-auto text-center flex items-center justify-center gap-2 backdrop-blur-sm">
              <Globe className="w-5 h-5 text-gray-400 group-hover:text-white transition-colors" />
              Source Code
            </a>
          </div>
        </div>
      </section>

      {/* Code Snippet / Demo Section */}
      <section className="py-24 px-6 bg-black relative border-y border-white/5" id="installation">
        <div className="max-w-5xl mx-auto">
          <div className="flex flex-col md:flex-row gap-12 items-center">
            
            <div className="w-full md:w-1/2">
              <h2 className="text-3xl font-bold tracking-tight text-white mb-6">Frictionless Deployment</h2>
              <p className="text-gray-400 leading-relaxed mb-6">
                CyberOS installs an entire security ecosystem in a single script. It pulls down everything from Nmap to Metasploit, configures Burp Suite, and sets up a beautifully themed XFCE session.
              </p>
              <ul className="space-y-4 text-sm text-gray-300 font-medium">
                <li className="flex items-center gap-3"><Crosshair className="w-4 h-4 text-cyan-500" /> One-command setup script</li>
                <li className="flex items-center gap-3"><Crosshair className="w-4 h-4 text-cyan-500" /> Automatic VNC Port translation</li>
                <li className="flex items-center gap-3"><Crosshair className="w-4 h-4 text-cyan-500" /> Beautiful abstract hacker aesthetics</li>
                <li className="flex items-center gap-3"><Crosshair className="w-4 h-4 text-cyan-500" /> Auto-updates on every launch</li>
              </ul>
            </div>

            <div className="w-full md:w-1/2">
              <div className="rounded-xl overflow-hidden border border-white/10 bg-[#0a0a0a] shadow-2xl relative group">
                <div className="absolute inset-0 bg-gradient-to-br from-cyan-500/5 to-transparent opacity-0 group-hover:opacity-100 transition-opacity" />
                <div className="flex items-center justify-between px-4 py-3 border-b border-white/5 bg-[#111]">
                  <div className="flex items-center gap-2">
                    <div className="w-3 h-3 rounded-full bg-red-500/80" />
                    <div className="w-3 h-3 rounded-full bg-yellow-500/80" />
                    <div className="w-3 h-3 rounded-full bg-green-500/80" />
                  </div>
                  <div className="text-xs text-gray-600 font-mono">root@cyberos:~</div>
                </div>
                <div className="p-6 font-mono text-sm leading-loose">
                  <div className="text-gray-400 flex items-center gap-4">
                    <span className="text-cyan-600 select-none">root#</span>
                    <span className="text-gray-200">git clone https://github.com/DXN1-termux/CyberOS.git</span>
                  </div>
                  <div className="text-gray-400 flex items-center gap-4 mt-2">
                    <span className="text-cyan-600 select-none">root#</span>
                    <span className="text-gray-200">cd CyberOS && ./setup.sh</span>
                  </div>
                  <div className="text-emerald-500/70 mt-2 text-xs pl-8 border-l border-white/10 ml-2 py-2">
                    [+] Initializing Advanced Arsenal...<br/>
                    [+] Fetching Nmap, SQLmap, Gobuster, Metasploit...<br/>
                    [+] Applying Custom Wallpaper Configuration...
                  </div>
                  <div className="text-gray-400 flex items-center gap-4 mt-4">
                    <span className="text-cyan-600 select-none">root#</span>
                    <span className="text-white font-bold text-cyan-100 glow">./CyberOS 5901</span>
                  </div>
                  <div className="text-cyan-400 mt-2 text-xs pl-8 border-l border-cyan-500/30 ml-2 py-2 font-bold tracking-wide">
                    [+] SYNERGY ESTABLISHED. CyberOS is live.<br/>
                    [{'>'}] VNC Payload bound to 0.0.0.0:5901
                  </div>
                </div>
              </div>
            </div>

          </div>
        </div>
      </section>

      {/* Massive Tool Deck Section */}
      <section id="tools" className="py-32 px-6 max-w-7xl mx-auto">
        <div className="text-center mb-20">
          <div className="inline-flex items-center justify-center w-12 h-12 rounded-2xl bg-cyan-950 text-cyan-400 mb-6">
            <Layers className="w-6 h-6" />
          </div>
          <h2 className="text-4xl font-extrabold tracking-tight text-white mb-4">A Massive Deck of Power</h2>
          <p className="text-gray-400 max-w-2xl mx-auto text-lg">Not just a browser and a proxy. CyberOS ships with a curated, heavy-duty stack of exploitation frameworks and recon engines.</p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-4">
          {[
            { name: 'Burp Suite Pro/CE', desc: 'The gold standard for web app testing.', icon: Target },
            { name: 'Nmap & Masscan', desc: 'Aggressive network discovery and port scanning.', icon: Network },
            { name: 'SQLmap', desc: 'Automatic SQL injection detection & exploitation.', icon: Shield },
            { name: 'Gobuster & Dirb', desc: 'Blazing fast directory and DNS brute-forcing.', icon: Zap },
            { name: 'Hydra & John', desc: 'Unrelenting password cracking and credential stuffing.', icon: Cpu },
            { name: 'WireShark', desc: 'Deep packet inspection and protocol analysis.', icon: Crosshair },
            { name: 'SecLists', desc: 'The pentester\'s companion for payloads and fuzzing.', icon: Layers },
            { name: 'Custom Aesthetic', desc: 'Cyberpunk wallpapers. Because looking cool matters.', icon: Terminal },
          ].map((tool, i) => (
            <div key={i} className="bg-[#0a0a0a] border border-white/5 p-6 rounded-2xl hover:bg-[#111] hover:border-cyan-500/20 transition-all group">
              <tool.icon className="w-8 h-8 text-cyan-500/50 mb-4 group-hover:text-cyan-400 transition-colors" />
              <h3 className="text-lg font-bold text-white mb-2">{tool.name}</h3>
              <p className="text-gray-500 text-sm leading-relaxed">{tool.desc}</p>
            </div>
          ))}
        </div>
      </section>

      {/* CTA */}
      <section className="py-24 px-6 relative border-t border-white/5 bg-gradient-to-b from-[#0a0a0a] to-black text-center">
        <h2 className="text-3xl md:text-5xl font-black text-white mb-6">Ready to hunt?</h2>
        <p className="text-gray-400 mb-10">Deploy your professional security environment in under 5 minutes.</p>
        <a href="#installation" className="inline-flex px-8 py-4 bg-white text-black font-bold rounded-lg hover:bg-gray-200 transition-colors shadow-lg shadow-white/10">
          Get Started Now
        </a>
      </section>

      {/* Footer */}
      <footer className="border-t border-white/5 bg-black py-8 px-6">
        <div className="max-w-7xl mx-auto flex flex-col md:flex-row justify-between items-center text-sm">
          <div className="flex items-center gap-2 mb-4 md:mb-0">
            <Shield className="w-5 h-5 text-gray-700" />
            <span className="font-bold text-gray-500 tracking-wider">CYBER<span className="text-cyan-800">OS</span></span>
          </div>
          <p className="text-gray-600 font-mono text-xs">
            // Authorized use only.
          </p>
        </div>
      </footer>

    </div>
  );
}

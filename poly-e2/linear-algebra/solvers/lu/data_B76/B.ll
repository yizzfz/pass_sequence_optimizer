; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.end18.for.body3.lr.ph_crit_edge, %entry
  %indvars.iv122 = phi i64 [ 0, %entry ], [ %indvars.iv.next123, %for.end18.for.body3.lr.ph_crit_edge ]
  %indvars.iv120 = phi i64 [ 1, %entry ], [ %indvars.iv.next121, %for.end18.for.body3.lr.ph_crit_edge ]
  %0 = phi [2000 x double]* [ %A, %entry ], [ %.pre, %for.end18.for.body3.lr.ph_crit_edge ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv107 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next108, %for.body3 ]
  %1 = sub nsw i64 0, %indvars.iv107
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv122, i64 %indvars.iv107
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next108, %indvars.iv120
  br i1 %exitcond113, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %cmp968 = icmp slt i64 %indvars.iv.next123, 2000
  br i1 %cmp968, label %for.body11.lr.ph, label %for.end18

for.body11.lr.ph:                                 ; preds = %for.end
  br label %for.body11

for.body11:                                       ; preds = %for.body11.for.body11_crit_edge, %for.body11.lr.ph
  %indvars.iv116 = phi i64 [ %indvars.iv120, %for.body11.lr.ph ], [ %indvars.iv.next117, %for.body11.for.body11_crit_edge ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx15, align 8
  %exitcond128 = icmp eq i64 %indvars.iv116, 1999
  br i1 %exitcond128, label %for.end18.loopexit, label %for.body11.for.body11_crit_edge

for.body11.for.body11_crit_edge:                  ; preds = %for.body11
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  br label %for.body11

for.end18.loopexit:                               ; preds = %for.body11
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv122
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond125 = icmp eq i64 %indvars.iv.next123, 2000
  br i1 %exitcond125, label %for.end25, label %for.end18.for.body3.lr.ph_crit_edge

for.end18.for.body3.lr.ph_crit_edge:              ; preds = %for.end18
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  br label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %3 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %3, align 8
  %4 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge, %for.end25
  %indvars.iv103 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next104, %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %5
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %exitcond127 = icmp eq i64 %indvars.iv103, 1999
  br i1 %exitcond127, label %for.cond48.preheader.us.preheader, label %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge

for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  br label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond133, label %for.body81.us.preheader, label %for.body51.lr.ph.us

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.us.preheader
  %indvars.iv95 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %indvars.iv.next96, %for.inc75.us ]
  br label %for.body51.us.us

for.body51.us.us:                                 ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv91 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next92, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv91, i64 %indvars.iv95
  br label %for.body55.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.body55.us.us
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond132, label %for.inc75.us, label %for.body51.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us.for.body55.us.us_crit_edge, %for.body51.us.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.body55.us.us.for.body55.us.us_crit_edge ], [ 0, %for.body51.us.us ]
  %6 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv87, i64 %indvars.iv95
  %7 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %6, %7
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %4, i64 0, i64 %indvars.iv91, i64 %indvars.iv87
  %8 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %8
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %exitcond = icmp eq i64 %indvars.iv87, 1999
  br i1 %exitcond, label %for.cond52.for.inc72_crit_edge.us.us, label %for.body55.us.us.for.body55.us.us_crit_edge

for.body55.us.us.for.body55.us.us_crit_edge:      ; preds = %for.body55.us.us
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  br label %for.body55.us.us

for.body81.us.preheader:                          ; preds = %for.inc75.us
  %9 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %10 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body81.us

for.body81.us:                                    ; preds = %for.cond82.for.inc97_crit_edge.us.1, %for.body81.us.preheader
  %indvars.iv83 = phi i64 [ 0, %for.body81.us.preheader ], [ %indvars.iv.next84.1, %for.cond82.for.inc97_crit_edge.us.1 ]
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us.for.body85.us_crit_edge, %for.body81.us
  %indvars.iv = phi i64 [ 0, %for.body81.us ], [ %indvars.iv.next, %for.body85.us.for.body85.us_crit_edge ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv83, i64 %indvars.iv
  %11 = bitcast double* %arrayidx89.us to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv83, i64 %indvars.iv
  %13 = bitcast double* %arrayidx93.us to i64*
  store i64 %12, i64* %13, align 8
  %exitcond126 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond126, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us.for.body85.us_crit_edge

for.body85.us.for.body85.us_crit_edge:            ; preds = %for.body85.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body85.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.body85.us
  %indvars.iv.next84 = or i64 %indvars.iv83, 1
  br label %for.body85.us.1

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us.1
  %14 = bitcast [2000 x [2000 x double]]* %9 to i8*
  tail call void @free(i8* %14) #4
  ret void

for.body85.us.1:                                  ; preds = %for.body85.us.for.body85.us_crit_edge.1, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv.1 = phi i64 [ 0, %for.cond82.for.inc97_crit_edge.us ], [ %indvars.iv.next.1, %for.body85.us.for.body85.us_crit_edge.1 ]
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv.next84, i64 %indvars.iv.1
  %15 = bitcast double* %arrayidx89.us.1 to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv.next84, i64 %indvars.iv.1
  %17 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %16, i64* %17, align 8
  %exitcond126.1 = icmp eq i64 %indvars.iv.1, 1999
  br i1 %exitcond126.1, label %for.cond82.for.inc97_crit_edge.us.1, label %for.body85.us.for.body85.us_crit_edge.1

for.body85.us.for.body85.us_crit_edge.1:          ; preds = %for.body85.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.body85.us.1

for.cond82.for.inc97_crit_edge.us.1:              ; preds = %for.body85.us.1
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %exitcond131.1 = icmp eq i64 %indvars.iv.next84.1, 2000
  br i1 %exitcond131.1, label %for.end99.loopexit, label %for.body81.us
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc54, %entry
  %indvars.iv52 = phi i64 [ 0, %entry ], [ %indvars.iv.next53, %for.inc54 ]
  %cmp211 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp211, label %for.body3.preheader, label %for.inc54

for.body3.preheader:                              ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.end ], [ 0, %for.body3.preheader ]
  %cmp57 = icmp sgt i64 %indvars.iv34, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.body6.preheader, label %for.end

for.body6.preheader:                              ; preds = %for.body3
  %xtraiter = and i64 %indvars.iv34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.preheader
  br label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.prol.preheader
  %0 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %1 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %0, %1
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.preheader, %for.body6.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.preheader ]
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  %2 = icmp eq i64 %indvars.iv34, 1
  br i1 %2, label %for.end.loopexit, label %for.body6.preheader.new

for.body6.preheader.new:                          ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.preheader.new ], [ %indvars.iv.next.1, %for.body6 ]
  %3 = phi double [ %.unr.ph, %for.body6.preheader.new ], [ %sub.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %4 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv34
  %5 = load double, double* %arrayidx12, align 8
  %mul = fmul double %4, %5
  %sub = fsub double %3, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next
  %6 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv34
  %7 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %6, %7
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body6

for.end.loopexit.unr-lcssa:                       ; preds = %for.body6
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body6.prol.loopexit, %for.end.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %sub.1, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3
  %8 = phi double [ %.pre, %for.body3 ], [ %sub.lcssa, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %9 = load double, double* %arrayidx20, align 8
  %div = fdiv double %8, %9
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv52
  br i1 %exitcond39, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.end
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.inc54_crit_edge

for.body30.lr.ph.for.inc54_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.inc54

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter58 = and i64 %indvars.iv52, 1
  %lcmp.mod59 = icmp eq i64 %xtraiter58, 0
  %10 = icmp eq i64 %indvars.iv52, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv52, %for.body30.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre30 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %lcmp.mod59, label %for.body33.us.prol.loopexit.unr-lcssa, label %for.body33.us.prol.preheader

for.body33.us.prol.preheader:                     ; preds = %for.body30.us
  br label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.body33.us.prol.preheader
  %11 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %12 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %11, %12
  %sub47.us.prol = fsub double %.pre30, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.body33.us.prol.loopexit.unr-lcssa

for.body33.us.prol.loopexit.unr-lcssa:            ; preds = %for.body30.us, %for.body33.us.prol
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.body30.us ]
  %.unr60.ph = phi double [ %sub47.us.prol, %for.body33.us.prol ], [ %.pre30, %for.body30.us ]
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol.loopexit.unr-lcssa
  br i1 %10, label %for.cond31.for.inc51_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.body30.us.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %for.body30.us.new ], [ %indvars.iv.next42.1, %for.body33.us ]
  %13 = phi double [ %.unr60.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body33.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv41
  %14 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv48
  %15 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %14, %15
  %sub47.us = fsub double %13, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next42
  %16 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv48
  %17 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %16, %17
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next42.1, %indvars.iv52
  br i1 %exitcond45.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.body33.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.body33.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.body33.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond56, label %for.inc54.loopexit, label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.body30.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit, %for.body
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond57, label %for.end56, label %for.body

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond15, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

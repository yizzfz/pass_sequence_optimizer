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
  %arraydecay3 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %for.cond1.preheader.lr.ph
  %indvars.iv116 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next117, %for.inc23 ]
  %indvars.iv114 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next115, %for.inc23 ]
  %0 = phi [2000 x double]* [ %A, %for.cond1.preheader.lr.ph ], [ %.lcssa, %for.inc23 ]
  %1 = sub i64 1999, %indvars.iv116
  %2 = sub i64 1998, %indvars.iv116
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv101 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next102, %for.inc ]
  %3 = sub nsw i64 0, %indvars.iv101
  %4 = trunc i64 %3 to i32
  %rem = srem i32 %4, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv101
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next102, %indvars.iv114
  br i1 %exitcond107, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %cmp964 = icmp slt i64 %indvars.iv.next117, 2000
  br i1 %cmp964, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.end
  %5 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv110.prol = phi i64 [ %indvars.iv114, %for.inc16.prol.preheader ], [ %indvars.iv.next111.prol, %for.inc16.prol ]
  %6 = phi [2000 x double]* [ %.pre, %for.inc16.prol.preheader ], [ %5, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv116, i64 %indvars.iv110.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next111.prol = add nuw nsw i64 %indvars.iv110.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv110.unr = phi i64 [ %indvars.iv114, %for.inc16.lr.ph ], [ %indvars.iv.next111.prol, %for.inc16.prol.loopexit.unr-lcssa ]
  %.unr = phi [2000 x double]* [ %.pre, %for.inc16.lr.ph ], [ %5, %for.inc16.prol.loopexit.unr-lcssa ]
  %7 = icmp ult i64 %2, 7
  br i1 %7, label %for.inc23.loopexit, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv110 = phi i64 [ %indvars.iv110.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next111.7, %for.inc16 ]
  %8 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %5, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv116, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv116, i64 %indvars.iv.next111
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv116, i64 %indvars.iv.next111.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next111.2 = add nsw i64 %indvars.iv110, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv116, i64 %indvars.iv.next111.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next111.3 = add nsw i64 %indvars.iv110, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv116, i64 %indvars.iv.next111.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next111.4 = add nsw i64 %indvars.iv110, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv116, i64 %indvars.iv.next111.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next111.5 = add nsw i64 %indvars.iv110, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv116, i64 %indvars.iv.next111.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next111.6 = add nsw i64 %indvars.iv110, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv116, i64 %indvars.iv.next111.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next111.7 = add nsw i64 %indvars.iv110, 8
  %exitcond122.7 = icmp eq i64 %indvars.iv.next111.6, 1999
  br i1 %exitcond122.7, label %for.inc23.loopexit.unr-lcssa, label %for.inc16

for.inc23.loopexit.unr-lcssa:                     ; preds = %for.inc16
  br label %for.inc23.loopexit

for.inc23.loopexit:                               ; preds = %for.inc16.prol.loopexit, %for.inc23.loopexit.unr-lcssa
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.end
  %.lcssa = phi [2000 x double]* [ %.pre, %for.end ], [ %5, %for.inc23.loopexit ]
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa, i64 %indvars.iv116, i64 %indvars.iv116
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next117, 2000
  br i1 %exitcond119, label %for.cond30.preheader.us.preheader, label %for.inc.lr.ph

for.cond30.preheader.us.preheader:                ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %9 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %9, align 8
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.cond30.preheader.us.preheader
  %indvars.iv97 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next98.7, %for.cond30.for.inc41_crit_edge.us ]
  %10 = mul nuw nsw i64 %indvars.iv97, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %11 = mul nuw nsw i64 %indvars.iv.next98, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1 = or i64 %indvars.iv97, 2
  %12 = mul nuw nsw i64 %indvars.iv.next98.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.2 = or i64 %indvars.iv97, 3
  %13 = mul nuw nsw i64 %indvars.iv.next98.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.3 = or i64 %indvars.iv97, 4
  %14 = mul nuw nsw i64 %indvars.iv.next98.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.4 = or i64 %indvars.iv97, 5
  %15 = mul nuw nsw i64 %indvars.iv.next98.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.5 = or i64 %indvars.iv97, 6
  %16 = mul nuw nsw i64 %indvars.iv.next98.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.6 = or i64 %indvars.iv97, 7
  %17 = mul nuw nsw i64 %indvars.iv.next98.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.7 = add nsw i64 %indvars.iv97, 8
  %exitcond121.7 = icmp eq i64 %indvars.iv.next98.6, 1999
  br i1 %exitcond121.7, label %for.cond48.preheader.us.preheader, label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  %18 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %19 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  br label %for.cond52.preheader.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond92, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.lr.ph.us

for.cond52.preheader.lr.ph.us:                    ; preds = %for.inc75.us, %for.cond48.preheader.us.preheader
  %indvars.iv89 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %indvars.iv.next90, %for.inc75.us ]
  %scevgep127 = getelementptr [2000 x double], [2000 x double]* %18, i64 0, i64 %indvars.iv89
  %20 = add i64 %indvars.iv89, 1
  %scevgep129 = getelementptr [2000 x double], [2000 x double]* %18, i64 1999, i64 %20
  br label %for.cond52.preheader.us.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.lr.ph.us
  %indvars.iv85 = phi i64 [ 0, %for.cond52.preheader.lr.ph.us ], [ %indvars.iv.next86, %for.cond52.for.inc72_crit_edge.us.us ]
  %scevgep123 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv85, i64 0
  %21 = add i64 %indvars.iv85, 1
  %scevgep125 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %21, i64 0
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv85, i64 %indvars.iv89
  %bound0 = icmp ult double* %scevgep123, %scevgep129
  %bound1 = icmp ult double* %scevgep127, %scevgep125
  %found.conflict = and i1 %bound0, %bound1
  %bound0132 = icmp ult double* %scevgep123, %arrayidx59.us.us
  %bound1133 = icmp ult double* %arrayidx59.us.us, %scevgep125
  %found.conflict134 = and i1 %bound0132, %bound1133
  %conflict.rdx = or i1 %found.conflict, %found.conflict134
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %25, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %index, i64 %indvars.iv89
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %22, i64 %indvars.iv89
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %23, i64 %indvars.iv89
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %24, i64 %indvars.iv89
  %34 = load double, double* %30, align 8, !alias.scope !6
  %35 = load double, double* %31, align 8, !alias.scope !6
  %36 = load double, double* %32, align 8, !alias.scope !6
  %37 = load double, double* %33, align 8, !alias.scope !6
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %37, i32 1
  %42 = fmul <2 x double> %27, %39
  %43 = fmul <2 x double> %29, %41
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv85, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !8, !noalias !10
  %48 = fadd <2 x double> %42, %wide.load
  %49 = fadd <2 x double> %43, %wide.load136
  %50 = bitcast double* %44 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !8, !noalias !10
  %51 = bitcast double* %46 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %52 = icmp eq i64 %index.next, 2000
  br i1 %52, label %for.cond52.for.inc72_crit_edge.us.us.loopexit167, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit167: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit167, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, 2000
  br i1 %exitcond88, label %for.inc75.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv81 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next82.1, %for.inc69.us.us ]
  %53 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv81, i64 %indvars.iv89
  %54 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %53, %54
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv85, i64 %indvars.iv81
  %55 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %55
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %56 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv.next82, i64 %indvars.iv89
  %57 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %56, %57
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next82
  %58 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %58
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next82, 1999
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

for.cond82.preheader.us.preheader:                ; preds = %for.inc75.us
  %59 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %60 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv77 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next78, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %60, i64 %indvars.iv77, i64 0
  %61 = add i64 %indvars.iv77, 1
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %60, i64 %61, i64 0
  %scevgep146 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv77, i64 0
  %scevgep148 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %61, i64 0
  %bound0150 = icmp ult double* %scevgep142, %scevgep148
  %bound1151 = icmp ult double* %scevgep146, %scevgep144
  %memcheck.conflict153 = and i1 %bound0150, %bound1151
  br i1 %memcheck.conflict153, label %for.inc94.us.preheader, label %vector.body137.preheader

vector.body137.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body137

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body137:                                   ; preds = %vector.body137, %vector.body137.preheader
  %index156 = phi i64 [ 0, %vector.body137.preheader ], [ %index.next157.1, %vector.body137 ]
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv77, i64 %index156
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load164 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !15
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  %wide.load165 = load <2 x i64>, <2 x i64>* %65, align 8, !alias.scope !15
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv77, i64 %index156
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load164, <2 x i64>* %67, align 8, !alias.scope !18, !noalias !15
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  store <2 x i64> %wide.load165, <2 x i64>* %69, align 8, !alias.scope !18, !noalias !15
  %index.next157 = or i64 %index156, 4
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv77, i64 %index.next157
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load164.1 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !15
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  %wide.load165.1 = load <2 x i64>, <2 x i64>* %73, align 8, !alias.scope !15
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv77, i64 %index.next157
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load164.1, <2 x i64>* %75, align 8, !alias.scope !18, !noalias !15
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  store <2 x i64> %wide.load165.1, <2 x i64>* %77, align 8, !alias.scope !18, !noalias !15
  %index.next157.1 = add nsw i64 %index156, 8
  %78 = icmp eq i64 %index.next157.1, 2000
  br i1 %78, label %for.cond82.for.inc97_crit_edge.us.loopexit166, label %vector.body137, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv77, i64 %indvars.iv
  %79 = bitcast double* %arrayidx89.us to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv77, i64 %indvars.iv
  %81 = bitcast double* %arrayidx93.us to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next
  %82 = bitcast double* %arrayidx89.us.1 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv77, i64 %indvars.iv.next
  %84 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %85 = bitcast double* %arrayidx89.us.2 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %87 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %88 = bitcast double* %arrayidx89.us.3 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %90 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %91 = bitcast double* %arrayidx89.us.4 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %93 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %92, i64* %93, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond120.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond120.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit166:    ; preds = %vector.body137
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit166, %for.cond82.for.inc97_crit_edge.us.loopexit
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 2000
  br i1 %exitcond80, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  %94 = bitcast [2000 x [2000 x double]]* %59 to i8*
  tail call void @free(i8* %94) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.lr.ph
  %indvars.iv47 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next48, %for.inc54 ]
  %0 = phi [2000 x double]* [ %A, %for.cond1.preheader.lr.ph ], [ %24, %for.inc54 ]
  %cmp27 = icmp sgt i64 %indvars.iv47, 0
  br i1 %cmp27, label %for.cond4.preheader.preheader, label %for.cond31.preheader.lr.ph.thread

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph.thread:                ; preds = %for.cond1.preheader
  %1 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc54

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %2 = phi [2000 x double]* [ %11, %for.inc25 ], [ %0, %for.cond4.preheader.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv29, 0
  br i1 %cmp55, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv29
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter = and i64 %indvars.iv29, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv47, i64 0
  %3 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 0, i64 %indvars.iv29
  %4 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %3, %4
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %5 = icmp eq i64 %indvars.iv29, 1
  br i1 %5, label %for.inc.for.inc25_crit_edge, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %6 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv
  %7 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv29
  %8 = load double, double* %arrayidx12, align 8
  %mul = fmul double %7, %8
  %sub = fsub double %6, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv29
  %10 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %9, %10
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv29
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.unr-lcssa, label %for.inc

for.inc.for.inc25_crit_edge.unr-lcssa:            ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.prol.loopexit, %for.inc.for.inc25_crit_edge.unr-lcssa
  %.pre23 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.cond4.preheader, %for.inc.for.inc25_crit_edge
  %11 = phi [2000 x double]* [ %.pre23, %for.inc.for.inc25_crit_edge ], [ %2, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv29, i64 %indvars.iv29
  %12 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv47, i64 %indvars.iv29
  %13 = load double, double* %arrayidx24, align 8
  %div = fdiv double %13, %12
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next30, %indvars.iv47
  br i1 %exitcond34, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  %14 = icmp sgt i64 %indvars.iv47, 0
  %15 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br i1 %14, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter51 = and i64 %indvars.iv47, 1
  %lcmp.mod52 = icmp eq i64 %xtraiter51, 0
  %16 = icmp eq i64 %indvars.iv47, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv47, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv47, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv47, i64 %indvars.iv43
  %.pre24 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod52, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %17 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 0, i64 %indvars.iv43
  %18 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %17, %18
  %sub47.us.prol = fsub double %.pre24, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv36.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr53.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre24, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %16, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv36 = phi i64 [ %indvars.iv36.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next37.1, %for.inc48.us ]
  %19 = phi double [ %.unr53.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv47, i64 %indvars.iv36
  %20 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv36, i64 %indvars.iv43
  %21 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %20, %21
  %sub47.us = fsub double %19, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv47, i64 %indvars.iv.next37
  %22 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv.next37, i64 %indvars.iv43
  %23 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %22, %23
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next37.1, %indvars.iv47
  br i1 %exitcond40.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond46, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond31.preheader.lr.ph.thread, %for.cond31.preheader.lr.ph
  %24 = phi [2000 x double]* [ %1, %for.cond31.preheader.lr.ph.thread ], [ %15, %for.cond31.preheader.lr.ph ], [ %15, %for.inc54.loopexit ]
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond50, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}

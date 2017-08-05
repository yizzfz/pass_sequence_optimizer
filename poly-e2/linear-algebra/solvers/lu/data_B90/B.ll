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
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %entry
  %indvars.iv105 = phi i64 [ 0, %entry ], [ %indvars.iv.next106, %for.inc23 ]
  %indvars.iv103 = phi i64 [ 1, %entry ], [ %indvars.iv.next104, %for.inc23 ]
  %0 = phi [2000 x double]* [ %A, %entry ], [ %.pre, %for.inc23 ]
  %1 = sub i64 1999, %indvars.iv105
  %2 = sub i64 1998, %indvars.iv105
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv90 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next91, %for.inc ]
  %3 = sub nsw i64 0, %indvars.iv90
  %4 = trunc i64 %3 to i32
  %rem = srem i32 %4, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv90
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next91, %indvars.iv103
  br i1 %exitcond96, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %cmp942 = icmp slt i64 %indvars.iv.next106, 2000
  br i1 %cmp942, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.end
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv99.prol = phi i64 [ %indvars.iv103, %for.inc16.prol.preheader ], [ %indvars.iv.next100.prol, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv99.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next100.prol = add nuw nsw i64 %indvars.iv99.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv99.unr = phi i64 [ %indvars.iv103, %for.inc16.lr.ph ], [ %indvars.iv.next100.prol, %for.inc16.prol.loopexit.unr-lcssa ]
  %5 = icmp ult i64 %2, 7
  br i1 %5, label %for.inc23.loopexit, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next100.7, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv99
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv.next100
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv.next100.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next100.2 = add nsw i64 %indvars.iv99, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv.next100.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next100.3 = add nsw i64 %indvars.iv99, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv.next100.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next100.4 = add nsw i64 %indvars.iv99, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv.next100.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next100.5 = add nsw i64 %indvars.iv99, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv.next100.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next100.6 = add nsw i64 %indvars.iv99, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv.next100.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond114.7 = icmp eq i64 %indvars.iv.next100.6, 1999
  %indvars.iv.next100.7 = add nsw i64 %indvars.iv99, 8
  br i1 %exitcond114.7, label %for.inc23.loopexit.unr-lcssa, label %for.inc16

for.inc23.loopexit.unr-lcssa:                     ; preds = %for.inc16
  br label %for.inc23.loopexit

for.inc23.loopexit:                               ; preds = %for.inc16.prol.loopexit, %for.inc23.loopexit.unr-lcssa
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 2000
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  br i1 %exitcond108, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.end25
  %indvar110 = phi i64 [ 0, %for.end25 ], [ %indvar.next111.7, %for.cond30.preheader.us ]
  %7 = mul nuw nsw i64 %indvar110, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %7
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111 = or i64 %indvar110, 1
  %8 = mul nuw nsw i64 %indvar.next111, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.1 = or i64 %indvar110, 2
  %9 = mul nuw nsw i64 %indvar.next111.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.2 = or i64 %indvar110, 3
  %10 = mul nuw nsw i64 %indvar.next111.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.3 = or i64 %indvar110, 4
  %11 = mul nuw nsw i64 %indvar.next111.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.4 = or i64 %indvar110, 5
  %12 = mul nuw nsw i64 %indvar.next111.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.5 = or i64 %indvar110, 6
  %13 = mul nuw nsw i64 %indvar.next111.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.6 = or i64 %indvar110, 7
  %14 = mul nuw nsw i64 %indvar.next111.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond130.7 = icmp eq i64 %indvar.next111.6, 1999
  %indvar.next111.7 = add nsw i64 %indvar110, 8
  br i1 %exitcond130.7, label %for.cond48.preheader.us.preheader, label %for.cond30.preheader.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.preheader.us
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.inc75.us, %for.cond48.preheader.us.preheader
  %indvars.iv126 = phi i64 [ %18, %for.inc75.us ], [ 0, %for.cond48.preheader.us.preheader ]
  %scevgep134 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 0, i64 %indvars.iv126
  %scevgep134135 = bitcast double* %scevgep134 to i8*
  %18 = add nuw nsw i64 %indvars.iv126, 1
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 1999, i64 %18
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  br label %for.cond52.preheader.us.us

for.inc75.us:                                     ; preds = %for.inc72.us.us
  %exitcond129 = icmp eq i64 %18, 2000
  br i1 %exitcond129, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.inc72.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %for.inc72.us.us ], [ 0, %for.cond52.preheader.us.us.preheader ]
  %19 = mul nuw nsw i64 %indvars.iv122, 16000
  %scevgep132 = getelementptr i8, i8* %call, i64 %19
  %20 = add nuw nsw i64 %19, 16000
  %scevgep133 = getelementptr i8, i8* %call, i64 %20
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv122, i64 %indvars.iv126
  %bound0 = icmp ult i8* %scevgep132, %scevgep136137
  %bound1 = icmp ult i8* %scevgep134135, %scevgep133
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0139 = icmp ult i8* %scevgep132, %bc
  %bound1140 = icmp ult i8* %bc, %scevgep133
  %found.conflict141 = and i1 %bound0139, %bound1140
  %conflict.rdx = or i1 %found.conflict, %found.conflict141
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %21 = or i64 %index, 1
  %22 = or i64 %index, 2
  %23 = or i64 %index, 3
  %24 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %index, i64 %indvars.iv126
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %21, i64 %indvars.iv126
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %22, i64 %indvars.iv126
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %23, i64 %indvars.iv126
  %31 = load double, double* %27, align 8, !alias.scope !6
  %32 = load double, double* %28, align 8, !alias.scope !6
  %33 = load double, double* %29, align 8, !alias.scope !6
  %34 = load double, double* %30, align 8, !alias.scope !6
  %35 = insertelement <2 x double> undef, double %31, i32 0
  %36 = insertelement <2 x double> %35, double %32, i32 1
  %37 = insertelement <2 x double> undef, double %33, i32 0
  %38 = insertelement <2 x double> %37, double %34, i32 1
  %39 = fmul <2 x double> %26, %36
  %40 = fmul <2 x double> %26, %38
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv122, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !8, !noalias !10
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load143 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %45 = fadd <2 x double> %wide.load, %39
  %46 = fadd <2 x double> %wide.load143, %40
  store <2 x double> %45, <2 x double>* %42, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %46, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %47 = icmp eq i64 %index.next, 2000
  br i1 %47, label %for.inc72.us.us.loopexit174, label %vector.body, !llvm.loop !11

for.inc72.us.us.loopexit:                         ; preds = %for.inc69.us.us
  br label %for.inc72.us.us

for.inc72.us.us.loopexit174:                      ; preds = %vector.body
  br label %for.inc72.us.us

for.inc72.us.us:                                  ; preds = %for.inc72.us.us.loopexit174, %for.inc72.us.us.loopexit
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next123, 2000
  br i1 %exitcond125, label %for.inc75.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv82 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next83.1, %for.inc69.us.us ]
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv82, i64 %indvars.iv126
  %49 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv122, i64 %indvars.iv82
  %50 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %50, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next83 = or i64 %indvars.iv82, 1
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv.next83, i64 %indvars.iv126
  %52 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv122, i64 %indvars.iv.next83
  %53 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %53, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next83, 1999
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82, 2
  br i1 %exitcond.1, label %for.inc72.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

for.cond82.preheader.us.preheader:                ; preds = %for.inc75.us
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.inc97.us, %for.cond82.preheader.us.preheader
  %indvars.iv118 = phi i64 [ %54, %for.inc97.us ], [ 0, %for.cond82.preheader.us.preheader ]
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv118, i64 0
  %54 = add nuw nsw i64 %indvars.iv118, 1
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 %54, i64 0
  %scevgep153 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv118, i64 0
  %scevgep155 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %54, i64 0
  %bound0157 = icmp ult double* %scevgep149, %scevgep155
  %bound1158 = icmp ult double* %scevgep153, %scevgep151
  %memcheck.conflict160 = and i1 %bound0157, %bound1158
  br i1 %memcheck.conflict160, label %for.inc94.us.preheader, label %vector.body144.preheader

vector.body144.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body144

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body144:                                   ; preds = %vector.body144, %vector.body144.preheader
  %index163 = phi i64 [ 0, %vector.body144.preheader ], [ %index.next164.1, %vector.body144 ]
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv118, i64 %index163
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load171 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !15
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load172 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !15
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv118, i64 %index163
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load171, <2 x i64>* %60, align 8, !alias.scope !18, !noalias !15
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load172, <2 x i64>* %62, align 8, !alias.scope !18, !noalias !15
  %index.next164 = or i64 %index163, 4
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv118, i64 %index.next164
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load171.1 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !15
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load172.1 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !15
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv118, i64 %index.next164
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load171.1, <2 x i64>* %68, align 8, !alias.scope !18, !noalias !15
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load172.1, <2 x i64>* %70, align 8, !alias.scope !18, !noalias !15
  %index.next164.1 = add nsw i64 %index163, 8
  %71 = icmp eq i64 %index.next164.1, 2000
  br i1 %71, label %for.inc97.us.loopexit173, label %vector.body144, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv118, i64 %indvars.iv
  %72 = bitcast double* %arrayidx89.us to i64*
  %73 = load i64, i64* %72, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv118, i64 %indvars.iv
  %74 = bitcast double* %arrayidx93.us to i64*
  store i64 %73, i64* %74, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next
  %75 = bitcast double* %arrayidx89.us.1 to i64*
  %76 = load i64, i64* %75, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv118, i64 %indvars.iv.next
  %77 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %76, i64* %77, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next.1
  %78 = bitcast double* %arrayidx89.us.2 to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv118, i64 %indvars.iv.next.1
  %80 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next.2
  %81 = bitcast double* %arrayidx89.us.3 to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv118, i64 %indvars.iv.next.2
  %83 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %6, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next.3
  %84 = bitcast double* %arrayidx89.us.4 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv118, i64 %indvars.iv.next.3
  %86 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %85, i64* %86, align 8
  %exitcond112.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond112.4, label %for.inc97.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.inc97.us.loopexit:                            ; preds = %for.inc94.us
  br label %for.inc97.us

for.inc97.us.loopexit173:                         ; preds = %vector.body144
  br label %for.inc97.us

for.inc97.us:                                     ; preds = %for.inc97.us.loopexit173, %for.inc97.us.loopexit
  %exitcond121 = icmp eq i64 %54, 2000
  br i1 %exitcond121, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.inc97.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc54
  %indvars.iv51 = phi i64 [ 0, %entry ], [ %indvars.iv.next52, %for.inc54 ]
  %cmp27 = icmp sgt i64 %indvars.iv51, 0
  br i1 %cmp27, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 0
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv29, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv29
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv29, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %0 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv29
  %1 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %0, %1
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %2 = icmp eq i64 %indvars.iv29, 1
  br i1 %2, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %3 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv
  %4 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv29
  %5 = load double, double* %arrayidx12, align 8
  %mul = fmul double %4, %5
  %sub = fsub double %3, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next
  %6 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv29
  %7 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %6, %7
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv29
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %8 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv29
  %9 = load double, double* %arrayidx20, align 8
  %div = fdiv double %8, %9
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next30, %indvars.iv51
  br i1 %exitcond34, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  br i1 true, label %for.cond31.preheader.us.preheader, label %for.cond31.preheader.lr.ph.for.inc54_crit_edge

for.cond31.preheader.lr.ph.for.inc54_crit_edge:   ; preds = %for.cond31.preheader.lr.ph
  br label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter53 = and i64 %indvars.iv51, 1
  %lcmp.mod54 = icmp eq i64 %xtraiter53, 0
  %10 = icmp eq i64 %indvars.iv51, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.inc51.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc51.us ], [ %indvars.iv51, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv47
  %.pre24 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod54, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %11 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv47
  %12 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %11, %12
  %sub47.us.prol = fsub double %.pre24, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv36.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr55.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre24, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %10, label %for.inc51.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv36 = phi i64 [ %indvars.iv36.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next37.1, %for.inc48.us ]
  %13 = phi double [ %.unr55.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv36
  %14 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv47
  %15 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %14, %15
  %sub47.us = fsub double %13, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next37
  %16 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next37, i64 %indvars.iv47
  %17 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %16, %17
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next37.1, %indvars.iv51
  br i1 %exitcond40.1, label %for.inc51.us.unr-lcssa, label %for.inc48.us

for.inc51.us.unr-lcssa:                           ; preds = %for.inc48.us
  br label %for.inc51.us

for.inc51.us:                                     ; preds = %for.inc48.us.prol.loopexit, %for.inc51.us.unr-lcssa
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond50, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.inc54.loopexit:                               ; preds = %for.inc51.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.cond31.preheader.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond49, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %entry
  %indvars.iv9 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv9, 2000
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
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond8, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
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

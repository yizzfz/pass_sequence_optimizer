; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(i32 2000, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %conv = sitofp i32 %n to double
  %cmp22 = icmp sgt i32 %n, 0
  br i1 %cmp22, label %for.body.preheader, label %for.end46.thread

for.body.preheader:                               ; preds = %entry
  %0 = add i32 %n, -1
  %wide.trip.count82 = zext i32 %0 to i64
  %1 = and i64 %wide.trip.count82, 1
  %lcmp.mod148 = icmp eq i64 %1, 0
  br i1 %lcmp.mod148, label %for.body.prol, label %for.body.prol.loopexit

for.body.prol:                                    ; preds = %for.body.preheader
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv80.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol ]
  %2 = icmp eq i32 %0, 0
  br i1 %2, label %for.cond13.preheader.preheader, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.prol.loopexit
  br label %for.body

for.cond13.preheader.preheader.loopexit:          ; preds = %for.body
  br label %for.cond13.preheader.preheader

for.cond13.preheader.preheader:                   ; preds = %for.cond13.preheader.preheader.loopexit, %for.body.prol.loopexit
  %3 = add i32 %n, -2
  %4 = zext i32 %3 to i64
  %5 = sext i32 %n to i64
  br label %for.body16.lr.ph

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv80 = phi i64 [ %indvars.iv80.unr, %for.body.preheader.new ], [ %indvars.iv.next81.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv80
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv80
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %6 = trunc i64 %indvars.iv.next81 to i32
  %conv4 = sitofp i32 %6 to double
  %div = fdiv double %conv4, %conv
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv80
  store double %add6, double* %arrayidx8, align 8
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next81
  store double 0.000000e+00, double* %arrayidx.1, align 8
  %arrayidx3.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next81
  store double 0.000000e+00, double* %arrayidx3.1, align 8
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %7 = trunc i64 %indvars.iv.next81.1 to i32
  %conv4.1 = sitofp i32 %7 to double
  %div.1 = fdiv double %conv4.1, %conv
  %div5.1 = fmul double %div.1, 5.000000e-01
  %add6.1 = fadd double %div5.1, 4.000000e+00
  %arrayidx8.1 = getelementptr inbounds double, double* %b, i64 %indvars.iv.next81
  store double %add6.1, double* %arrayidx8.1, align 8
  %exitcond83.1 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83.1, label %for.cond13.preheader.preheader.loopexit, label %for.body

for.body16.lr.ph:                                 ; preds = %for.end39, %for.cond13.preheader.preheader
  %indvars.iv78 = phi i64 [ 0, %for.cond13.preheader.preheader ], [ %indvars.iv.next79, %for.end39 ]
  %8 = shl i64 %indvars.iv78, 32
  %sext = add i64 %8, 4294967296
  %9 = ashr exact i64 %sext, 32
  %scevgep76 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %9
  %10 = sub i64 %4, %indvars.iv78
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  %13 = add nuw nsw i64 %12, 8
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %cmp3018 = icmp slt i64 %indvars.iv.next79, %5
  br i1 %cmp3018, label %for.end39.loopexit, label %for.end39

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.body16 ], [ 0, %for.body16.lr.ph ]
  %14 = sub nsw i64 0, %indvars.iv62
  %15 = trunc i64 %14 to i32
  %rem = srem i32 %15, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv62
  store double %add20, double* %arrayidx24, align 8
  %exitcond68 = icmp eq i64 %indvars.iv62, %indvars.iv78
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br i1 %exitcond68, label %for.cond29.preheader, label %for.body16

for.end39.loopexit:                               ; preds = %for.cond29.preheader
  %16 = bitcast double* %scevgep76 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %16, i8 0, i64 %13, i32 8, i1 false)
  br label %for.end39

for.end39:                                        ; preds = %for.cond29.preheader, %for.end39.loopexit
  %17 = icmp slt i64 %indvars.iv.next79, %5
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv78
  store double 1.000000e+00, double* %arrayidx43, align 8
  br i1 %17, label %for.body16.lr.ph, label %for.cond51.preheader.lr.ph

for.end46.thread:                                 ; preds = %entry
  %call87 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.cond51.preheader.lr.ph:                       ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %18 = shl nuw nsw i64 %wide.trip.count82, 3
  %19 = add nuw nsw i64 %18, 8
  %20 = add nsw i64 %5, -1
  %xtraiter144 = and i64 %5, 7
  %lcmp.mod145 = icmp eq i64 %xtraiter144, 0
  br i1 %lcmp.mod145, label %for.cond51.for.inc62_crit_edge.us.prol.loopexit, label %for.cond51.for.inc62_crit_edge.us.prol.preheader

for.cond51.for.inc62_crit_edge.us.prol.preheader: ; preds = %for.cond51.preheader.lr.ph
  br label %for.cond51.for.inc62_crit_edge.us.prol

for.cond51.for.inc62_crit_edge.us.prol:           ; preds = %for.cond51.for.inc62_crit_edge.us.prol, %for.cond51.for.inc62_crit_edge.us.prol.preheader
  %indvars.iv60.prol = phi i64 [ 0, %for.cond51.for.inc62_crit_edge.us.prol.preheader ], [ %indvars.iv.next61.prol, %for.cond51.for.inc62_crit_edge.us.prol ]
  %prol.iter146 = phi i64 [ %xtraiter144, %for.cond51.for.inc62_crit_edge.us.prol.preheader ], [ %prol.iter146.sub, %for.cond51.for.inc62_crit_edge.us.prol ]
  %21 = mul nuw nsw i64 %indvars.iv60.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %19, i32 8, i1 false)
  %indvars.iv.next61.prol = add nuw i64 %indvars.iv60.prol, 1
  %prol.iter146.sub = add i64 %prol.iter146, -1
  %prol.iter146.cmp = icmp eq i64 %prol.iter146.sub, 0
  br i1 %prol.iter146.cmp, label %for.cond51.for.inc62_crit_edge.us.prol.loopexit.loopexit, label %for.cond51.for.inc62_crit_edge.us.prol, !llvm.loop !1

for.cond51.for.inc62_crit_edge.us.prol.loopexit.loopexit: ; preds = %for.cond51.for.inc62_crit_edge.us.prol
  br label %for.cond51.for.inc62_crit_edge.us.prol.loopexit

for.cond51.for.inc62_crit_edge.us.prol.loopexit:  ; preds = %for.cond51.for.inc62_crit_edge.us.prol.loopexit.loopexit, %for.cond51.preheader.lr.ph
  %indvars.iv60.unr = phi i64 [ 0, %for.cond51.preheader.lr.ph ], [ %indvars.iv.next61.prol, %for.cond51.for.inc62_crit_edge.us.prol.loopexit.loopexit ]
  %22 = icmp ult i64 %20, 7
  br i1 %22, label %for.cond69.preheader.lr.ph, label %for.cond51.preheader.lr.ph.new

for.cond51.preheader.lr.ph.new:                   ; preds = %for.cond51.for.inc62_crit_edge.us.prol.loopexit
  br label %for.cond51.for.inc62_crit_edge.us

for.cond51.for.inc62_crit_edge.us:                ; preds = %for.cond51.for.inc62_crit_edge.us, %for.cond51.preheader.lr.ph.new
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr, %for.cond51.preheader.lr.ph.new ], [ %indvars.iv.next61.7, %for.cond51.for.inc62_crit_edge.us ]
  %23 = mul nuw nsw i64 %indvars.iv60, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %19, i32 8, i1 false)
  %24 = mul i64 %indvars.iv60, 16000
  %25 = add i64 %24, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %19, i32 8, i1 false)
  %26 = mul i64 %indvars.iv60, 16000
  %27 = add i64 %26, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %19, i32 8, i1 false)
  %28 = mul i64 %indvars.iv60, 16000
  %29 = add i64 %28, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %19, i32 8, i1 false)
  %30 = mul i64 %indvars.iv60, 16000
  %31 = add i64 %30, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %19, i32 8, i1 false)
  %32 = mul i64 %indvars.iv60, 16000
  %33 = add i64 %32, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %19, i32 8, i1 false)
  %34 = mul i64 %indvars.iv60, 16000
  %35 = add i64 %34, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %19, i32 8, i1 false)
  %36 = mul i64 %indvars.iv60, 16000
  %37 = add i64 %36, 112000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %19, i32 8, i1 false)
  %indvars.iv.next61.7 = add i64 %indvars.iv60, 8
  %cmp48.us.7 = icmp slt i64 %indvars.iv.next61.7, %5
  br i1 %cmp48.us.7, label %for.cond51.for.inc62_crit_edge.us, label %for.cond69.preheader.lr.ph.loopexit

for.cond69.preheader.lr.ph.loopexit:              ; preds = %for.cond51.for.inc62_crit_edge.us
  br label %for.cond69.preheader.lr.ph

for.cond69.preheader.lr.ph:                       ; preds = %for.cond69.preheader.lr.ph.loopexit, %for.cond51.for.inc62_crit_edge.us.prol.loopexit
  %38 = add nuw nsw i64 %wide.trip.count82, 1
  %39 = shl nuw nsw i64 %wide.trip.count82, 3
  %40 = add nuw nsw i64 %39, 8
  %41 = add nuw nsw i64 %wide.trip.count82, 1
  %min.iters.check = icmp ult i64 %38, 4
  %42 = bitcast i8* %call to [2000 x [2000 x double]]*
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  %44 = bitcast i8* %call to [2000 x [2000 x double]]*
  %n.vec = and i64 %38, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %45 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n = icmp eq i64 %38, %n.vec
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond69.for.inc96_crit_edge.us, %for.cond69.preheader.lr.ph
  %indvars.iv54 = phi i64 [ 0, %for.cond69.preheader.lr.ph ], [ %indvars.iv.next55, %for.cond69.for.inc96_crit_edge.us ]
  %scevgep99 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv54
  %46 = add i64 %indvars.iv54, 1
  %scevgep101 = getelementptr [2000 x double], [2000 x double]* %A, i64 %wide.trip.count82, i64 %46
  %47 = bitcast double* %scevgep101 to i8*
  %48 = bitcast double* %scevgep99 to i8*
  br label %for.cond73.preheader.us.us

for.cond69.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next55 = add nuw i64 %indvars.iv54, 1
  %cmp66.us = icmp slt i64 %indvars.iv.next55, %5
  br i1 %cmp66.us, label %for.cond73.preheader.us.us.preheader, label %for.cond103.preheader.lr.ph

for.cond73.preheader.us.us:                       ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.cond73.preheader.us.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next53, %for.cond73.for.inc93_crit_edge.us.us ]
  %49 = mul i64 %indvars.iv52, 16000
  %scevgep97 = getelementptr i8, i8* %call, i64 %49
  %50 = add i64 %40, %49
  %scevgep98 = getelementptr i8, i8* %call, i64 %50
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv54
  br i1 %min.iters.check, label %for.body76.us.us.preheader, label %min.iters.checked

for.body76.us.us.preheader:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond73.preheader.us.us
  %indvars.iv48.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond73.preheader.us.us ], [ %n.vec, %middle.block ]
  %51 = sub nsw i64 %41, %indvars.iv48.ph
  %xtraiter142 = and i64 %51, 1
  %lcmp.mod143 = icmp eq i64 %xtraiter142, 0
  br i1 %lcmp.mod143, label %for.body76.us.us.prol.loopexit, label %for.body76.us.us.prol

for.body76.us.us.prol:                            ; preds = %for.body76.us.us.preheader
  %52 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48.ph, i64 %indvars.iv54
  %53 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %52, %53
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv52, i64 %indvars.iv48.ph
  %54 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %54, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next49.prol = or i64 %indvars.iv48.ph, 1
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol.loopexit:                   ; preds = %for.body76.us.us.prol, %for.body76.us.us.preheader
  %indvars.iv48.unr.ph = phi i64 [ %indvars.iv.next49.prol, %for.body76.us.us.prol ], [ %indvars.iv48.ph, %for.body76.us.us.preheader ]
  %55 = icmp eq i64 %wide.trip.count82, %indvars.iv48.ph
  br i1 %55, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body76.us.us.preheader.new

for.body76.us.us.preheader.new:                   ; preds = %for.body76.us.us.prol.loopexit
  br label %for.body76.us.us

min.iters.checked:                                ; preds = %for.cond73.preheader.us.us
  br i1 %cmp.zero, label %for.body76.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep97, %47
  %bound1 = icmp ult i8* %48, %scevgep98
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bc103 = bitcast double* %arrayidx80.us.us to i8*
  %bound0104 = icmp ult i8* %scevgep97, %bc103
  %bound1105 = icmp ult i8* %bc, %scevgep98
  %found.conflict106 = and i1 %bound0104, %bound1105
  %conflict.rdx = or i1 %found.conflict, %found.conflict106
  br i1 %conflict.rdx, label %for.body76.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %56 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !3
  %57 = insertelement <2 x double> undef, double %56, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = insertelement <2 x double> undef, double %56, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %61 = or i64 %index, 1
  %62 = or i64 %index, 2
  %63 = or i64 %index, 3
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv54
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %61, i64 %indvars.iv54
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %62, i64 %indvars.iv54
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %63, i64 %indvars.iv54
  %68 = load double, double* %64, align 8, !alias.scope !6
  %69 = load double, double* %65, align 8, !alias.scope !6
  %70 = load double, double* %66, align 8, !alias.scope !6
  %71 = load double, double* %67, align 8, !alias.scope !6
  %72 = insertelement <2 x double> undef, double %68, i32 0
  %73 = insertelement <2 x double> %72, double %69, i32 1
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %71, i32 1
  %76 = fmul <2 x double> %58, %73
  %77 = fmul <2 x double> %60, %75
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv52, i64 %index
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !8, !noalias !10
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !8, !noalias !10
  %82 = fadd <2 x double> %wide.load, %76
  %83 = fadd <2 x double> %wide.load108, %77
  %84 = bitcast double* %78 to <2 x double>*
  store <2 x double> %82, <2 x double>* %84, align 8, !alias.scope !8, !noalias !10
  %85 = bitcast double* %80 to <2 x double>*
  store <2 x double> %83, <2 x double>* %85, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %86 = icmp eq i64 %index.next, %n.vec
  br i1 %86, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body76.us.us.preheader

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body76.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit, %for.body76.us.us.prol.loopexit, %middle.block
  %indvars.iv.next53 = add nuw i64 %indvars.iv52, 1
  %cmp70.us.us = icmp slt i64 %indvars.iv.next53, %5
  br i1 %cmp70.us.us, label %for.cond73.preheader.us.us, label %for.cond69.for.inc96_crit_edge.us

for.body76.us.us:                                 ; preds = %for.body76.us.us, %for.body76.us.us.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %for.body76.us.us.preheader.new ], [ %indvars.iv.next49.1, %for.body76.us.us ]
  %87 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv54
  %88 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %87, %88
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv52, i64 %indvars.iv48
  %89 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %89, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %90 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next49, i64 %indvars.iv54
  %91 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %90, %91
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv52, i64 %indvars.iv.next49
  %92 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %92, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49, %wide.trip.count82
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  br i1 %exitcond51.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body76.us.us, !llvm.loop !14

for.cond103.preheader.lr.ph:                      ; preds = %for.cond69.for.inc96_crit_edge.us
  %93 = add nuw nsw i64 %wide.trip.count82, 1
  %94 = shl nuw nsw i64 %wide.trip.count82, 3
  %95 = add nuw nsw i64 %94, 8
  %96 = and i64 %93, 8589934588
  %97 = add nsw i64 %96, -4
  %98 = lshr exact i64 %97, 2
  %99 = add nuw nsw i64 %wide.trip.count82, 1
  %min.iters.check112 = icmp ult i64 %93, 4
  %100 = bitcast i8* %call to [2000 x [2000 x double]]*
  %101 = bitcast i8* %call to [2000 x [2000 x double]]*
  %102 = bitcast i8* %call to [2000 x [2000 x double]]*
  %103 = bitcast i8* %call to [2000 x [2000 x double]]*
  %104 = bitcast i8* %call to [2000 x [2000 x double]]*
  %n.vec115 = and i64 %93, 8589934588
  %cmp.zero116 = icmp eq i64 %n.vec115, 0
  %105 = and i64 %98, 1
  %lcmp.mod = icmp eq i64 %105, 0
  %106 = bitcast i8* %call to [2000 x [2000 x double]]*
  %107 = icmp eq i64 %98, 0
  %cmp.n133 = icmp eq i64 %93, %n.vec115
  %108 = bitcast i8* %call to [2000 x [2000 x double]]*
  %109 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.cond103.for.inc118_crit_edge.us, %for.cond103.preheader.lr.ph
  %indvars.iv46 = phi i64 [ 0, %for.cond103.preheader.lr.ph ], [ %indvars.iv.next47, %for.cond103.for.inc118_crit_edge.us ]
  %scevgep118 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  %scevgep120 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %93
  %110 = mul i64 %indvars.iv46, 16000
  %scevgep122 = getelementptr i8, i8* %call, i64 %110
  %111 = add i64 %95, %110
  %scevgep123 = getelementptr i8, i8* %call, i64 %111
  br i1 %min.iters.check112, label %for.body106.us.preheader, label %min.iters.checked113

min.iters.checked113:                             ; preds = %for.cond103.preheader.us
  br i1 %cmp.zero116, label %for.body106.us.preheader, label %vector.memcheck128

vector.memcheck128:                               ; preds = %min.iters.checked113
  %112 = bitcast double* %scevgep120 to i8*
  %113 = bitcast double* %scevgep118 to i8*
  %bound0124 = icmp ult i8* %113, %scevgep123
  %bound1125 = icmp ult i8* %scevgep122, %112
  %memcheck.conflict127 = and i1 %bound0124, %bound1125
  br i1 %memcheck.conflict127, label %for.body106.us.preheader, label %vector.body109.preheader

vector.body109.preheader:                         ; preds = %vector.memcheck128
  br i1 %lcmp.mod, label %vector.body109.prol, label %vector.body109.prol.loopexit

vector.body109.prol:                              ; preds = %vector.body109.preheader
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv46, i64 0
  %115 = bitcast double* %114 to <2 x i64>*
  %wide.load138.prol = load <2 x i64>, <2 x i64>* %115, align 8, !alias.scope !15
  %116 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %106, i64 0, i64 %indvars.iv46, i64 2
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load139.prol = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !15
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  %119 = bitcast double* %118 to <2 x i64>*
  store <2 x i64> %wide.load138.prol, <2 x i64>* %119, align 8, !alias.scope !18, !noalias !15
  %120 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 2
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load139.prol, <2 x i64>* %121, align 8, !alias.scope !18, !noalias !15
  br label %vector.body109.prol.loopexit

vector.body109.prol.loopexit:                     ; preds = %vector.body109.prol, %vector.body109.preheader
  %index130.unr.ph = phi i64 [ 4, %vector.body109.prol ], [ 0, %vector.body109.preheader ]
  br i1 %107, label %middle.block110, label %vector.body109.preheader.new

vector.body109.preheader.new:                     ; preds = %vector.body109.prol.loopexit
  br label %vector.body109

vector.body109:                                   ; preds = %vector.body109, %vector.body109.preheader.new
  %index130 = phi i64 [ %index130.unr.ph, %vector.body109.preheader.new ], [ %index.next131.1, %vector.body109 ]
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %108, i64 0, i64 %indvars.iv46, i64 %index130
  %123 = bitcast double* %122 to <2 x i64>*
  %wide.load138 = load <2 x i64>, <2 x i64>* %123, align 8, !alias.scope !15
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x i64>*
  %wide.load139 = load <2 x i64>, <2 x i64>* %125, align 8, !alias.scope !15
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %index130
  %127 = bitcast double* %126 to <2 x i64>*
  store <2 x i64> %wide.load138, <2 x i64>* %127, align 8, !alias.scope !18, !noalias !15
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x i64>*
  store <2 x i64> %wide.load139, <2 x i64>* %129, align 8, !alias.scope !18, !noalias !15
  %index.next131 = add i64 %index130, 4
  %130 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %109, i64 0, i64 %indvars.iv46, i64 %index.next131
  %131 = bitcast double* %130 to <2 x i64>*
  %wide.load138.1 = load <2 x i64>, <2 x i64>* %131, align 8, !alias.scope !15
  %132 = getelementptr double, double* %130, i64 2
  %133 = bitcast double* %132 to <2 x i64>*
  %wide.load139.1 = load <2 x i64>, <2 x i64>* %133, align 8, !alias.scope !15
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %index.next131
  %135 = bitcast double* %134 to <2 x i64>*
  store <2 x i64> %wide.load138.1, <2 x i64>* %135, align 8, !alias.scope !18, !noalias !15
  %136 = getelementptr double, double* %134, i64 2
  %137 = bitcast double* %136 to <2 x i64>*
  store <2 x i64> %wide.load139.1, <2 x i64>* %137, align 8, !alias.scope !18, !noalias !15
  %index.next131.1 = add i64 %index130, 8
  %138 = icmp eq i64 %index.next131.1, %n.vec115
  br i1 %138, label %middle.block110.loopexit, label %vector.body109, !llvm.loop !20

middle.block110.loopexit:                         ; preds = %vector.body109
  br label %middle.block110

middle.block110:                                  ; preds = %middle.block110.loopexit, %vector.body109.prol.loopexit
  br i1 %cmp.n133, label %for.cond103.for.inc118_crit_edge.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %middle.block110, %vector.memcheck128, %min.iters.checked113, %for.cond103.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck128 ], [ 0, %min.iters.checked113 ], [ 0, %for.cond103.preheader.us ], [ %n.vec115, %middle.block110 ]
  %139 = sub nsw i64 %99, %indvars.iv.ph
  %140 = sub nsw i64 %wide.trip.count82, %indvars.iv.ph
  %xtraiter140 = and i64 %139, 3
  %lcmp.mod141 = icmp eq i64 %xtraiter140, 0
  br i1 %lcmp.mod141, label %for.body106.us.prol.loopexit, label %for.body106.us.prol.preheader

for.body106.us.prol.preheader:                    ; preds = %for.body106.us.preheader
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol, %for.body106.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol ], [ %indvars.iv.ph, %for.body106.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body106.us.prol ], [ %xtraiter140, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %104, i64 0, i64 %indvars.iv46, i64 %indvars.iv.prol
  %141 = bitcast double* %arrayidx110.us.prol to i64*
  %142 = load i64, i64* %141, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.prol
  %143 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %142, i64* %143, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol, !llvm.loop !21

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.body106.us.prol.loopexit.loopexit, %for.body106.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.body106.us.preheader ], [ %indvars.iv.next.prol, %for.body106.us.prol.loopexit.loopexit ]
  %144 = icmp ult i64 %140, 3
  br i1 %144, label %for.cond103.for.inc118_crit_edge.us, label %for.body106.us.preheader.new

for.body106.us.preheader.new:                     ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us, %for.body106.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body106.us.preheader.new ], [ %indvars.iv.next.3, %for.body106.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %100, i64 0, i64 %indvars.iv46, i64 %indvars.iv
  %145 = bitcast double* %arrayidx110.us to i64*
  %146 = load i64, i64* %145, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %147 = bitcast double* %arrayidx114.us to i64*
  store i64 %146, i64* %147, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %101, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next
  %148 = bitcast double* %arrayidx110.us.1 to i64*
  %149 = load i64, i64* %148, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %150 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %149, i64* %150, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %102, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %151 = bitcast double* %arrayidx110.us.2 to i64*
  %152 = load i64, i64* %151, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %153 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %152, i64* %153, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %103, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %154 = bitcast double* %arrayidx110.us.3 to i64*
  %155 = load i64, i64* %154, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %156 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %155, i64* %156, align 8
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count82
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond.3, label %for.cond103.for.inc118_crit_edge.us.loopexit, label %for.body106.us, !llvm.loop !22

for.cond103.for.inc118_crit_edge.us.loopexit:     ; preds = %for.body106.us
  br label %for.cond103.for.inc118_crit_edge.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.cond103.for.inc118_crit_edge.us.loopexit, %for.body106.us.prol.loopexit, %middle.block110
  %indvars.iv.next47 = add nuw i64 %indvars.iv46, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next47, %5
  br i1 %cmp100.us, label %for.cond103.preheader.us, label %for.end120.loopexit

for.end120.loopexit:                              ; preds = %for.cond103.for.inc118_crit_edge.us
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.end46.thread
  %call899295 = phi i8* [ %call87, %for.end46.thread ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call899295) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %for.cond1.preheader.preheader, label %for.end113

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc58 ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv50 = phi i32 [ %indvars.iv.next51, %for.inc58 ], [ -1, %for.cond1.preheader.preheader ]
  %1 = add i64 %indvars.iv58, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp218 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp218, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 0
  br label %for.body3

for.body30.us.preheader:                          ; preds = %for.end
  %wide.trip.count52 = zext i32 %indvars.iv50 to i64
  %3 = and i64 %1, 1
  %lcmp.mod73 = icmp eq i64 %3, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 0
  %4 = icmp eq i64 %2, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond35.for.end50_crit_edge.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv58, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv56
  %5 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod73, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %6 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv56
  %7 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %6, %7
  %sub47.us.prol = fsub double %5, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv48.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.122.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %5, %for.body30.us ]
  br i1 %4, label %for.cond35.for.end50_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %for.body30.us.new ], [ %indvars.iv.next49.1, %for.inc48.us ]
  %w.122.us = phi double [ %w.122.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv48
  %8 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv56
  %9 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %8, %9
  %sub47.us = fsub double %w.122.us, %mul46.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next49
  %10 = load double, double* %arrayidx41.us.1, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next49, i64 %indvars.iv56
  %11 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.1 = fmul double %10, %11
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.1
  %exitcond53.1 = icmp eq i64 %indvars.iv.next49, %wide.trip.count52
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  br i1 %exitcond53.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.inc48.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.cond35.for.end50_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next57 = add nuw i64 %indvars.iv56, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next57, %0
  br i1 %cmp29.us, label %for.body30.us, label %for.inc58.loopexit

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.end ], [ 0, %for.body3.preheader ]
  %indvars.iv41 = phi i32 [ %indvars.iv.next42, %for.end ], [ -1, %for.body3.preheader ]
  %12 = add i64 %indvars.iv45, 4294967295
  %13 = and i64 %12, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv45
  %14 = load double, double* %arrayidx5, align 8
  %cmp714 = icmp sgt i64 %indvars.iv45, 0
  br i1 %cmp714, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body3
  %wide.trip.count43 = zext i32 %indvars.iv41 to i64
  %15 = and i64 %12, 1
  %lcmp.mod71 = icmp eq i64 %15, 0
  br i1 %lcmp.mod71, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %16 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv45
  %17 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %16, %17
  %sub.prol = fsub double %14, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv39.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.016.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %14, %for.inc.preheader ]
  %18 = icmp eq i64 %13, 0
  br i1 %18, label %for.end, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv39 = phi i64 [ %indvars.iv39.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next40.1, %for.inc ]
  %w.016 = phi double [ %w.016.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv39
  %19 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv45
  %20 = load double, double* %arrayidx16, align 8
  %mul = fmul double %19, %20
  %sub = fsub double %w.016, %mul
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv.next40
  %21 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next40, i64 %indvars.iv45
  %22 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %21, %22
  %sub.1 = fsub double %sub, %mul.1
  %exitcond44.1 = icmp eq i64 %indvars.iv.next40, %wide.trip.count43
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  br i1 %exitcond44.1, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %14, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv45
  %23 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %23
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next46 = add nuw i64 %indvars.iv45, 1
  %cmp2 = icmp slt i64 %indvars.iv.next46, %indvars.iv58
  %indvars.iv.next42 = add nsw i32 %indvars.iv41, 1
  br i1 %cmp2, label %for.body3, label %for.body30.us.preheader

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader
  %indvars.iv.next59 = add nuw i64 %indvars.iv58, 1
  %cmp = icmp slt i64 %indvars.iv.next59, %0
  %indvars.iv.next51 = add nsw i32 %indvars.iv50, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.body63.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  %24 = add i32 %n, -1
  %wide.trip.count = sext i32 %24 to i64
  %25 = add nsw i64 %wide.trip.count, 1
  %26 = sub nsw i64 %25, %0
  %27 = sub nsw i64 %wide.trip.count, %0
  %28 = ptrtoint double* %x to i64
  br label %for.body88

for.body63:                                       ; preds = %for.body63.preheader, %for.end79
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.end79 ], [ 0, %for.body63.preheader ]
  %indvars.iv33 = phi i32 [ %indvars.iv.next34, %for.end79 ], [ -1, %for.body63.preheader ]
  %29 = add i64 %indvars.iv37, 4294967295
  %30 = and i64 %29, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv37
  %31 = load double, double* %arrayidx65, align 8
  %cmp678 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp678, label %for.inc77.preheader, label %for.end79

for.inc77.preheader:                              ; preds = %for.body63
  %wide.trip.count35 = zext i32 %indvars.iv33 to i64
  %xtraiter67 = and i64 %indvars.iv37, 3
  %lcmp.mod68 = icmp eq i64 %xtraiter67, 0
  br i1 %lcmp.mod68, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.210.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %31, %for.inc77.prol.preheader ]
  %prol.iter69 = phi i64 [ %prol.iter69.sub, %for.inc77.prol ], [ %xtraiter67, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.prol
  %32 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %33 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %32, %33
  %sub76.prol = fsub double %w.210.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter69.sub = add i64 %prol.iter69, -1
  %prol.iter69.cmp = icmp eq i64 %prol.iter69.sub, 0
  br i1 %prol.iter69.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !23

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.210.unr = phi double [ %31, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %34 = icmp ult i64 %30, 3
  br i1 %34, label %for.end79, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc77.preheader.new ], [ %indvars.iv.next.3, %for.inc77 ]
  %w.210 = phi double [ %w.210.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv
  %35 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %36 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %35, %36
  %sub76 = fsub double %w.210, %mul75
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx72.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next
  %37 = load double, double* %arrayidx72.1, align 8
  %arrayidx74.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx74.1, align 8
  %mul75.1 = fmul double %37, %38
  %sub76.1 = fsub double %sub76, %mul75.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next.1
  %39 = load double, double* %arrayidx72.2, align 8
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %40 = load double, double* %arrayidx74.2, align 8
  %mul75.2 = fmul double %39, %40
  %sub76.2 = fsub double %sub76.1, %mul75.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx72.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next.2
  %41 = load double, double* %arrayidx72.3, align 8
  %arrayidx74.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %42 = load double, double* %arrayidx74.3, align 8
  %mul75.3 = fmul double %41, %42
  %sub76.3 = fsub double %sub76.2, %mul75.3
  %exitcond36.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count35
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond36.3, label %for.end79.loopexit, label %for.inc77

for.end79.loopexit:                               ; preds = %for.inc77
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %31, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv37
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next38 = add nuw i64 %indvars.iv37, 1
  %cmp62 = icmp slt i64 %indvars.iv.next38, %0
  %indvars.iv.next34 = add nsw i32 %indvars.iv33, 1
  br i1 %cmp62, label %for.body63, label %for.body88.preheader

for.body88:                                       ; preds = %for.end104, %for.body88.preheader
  %indvar = phi i64 [ %indvar.next, %for.end104 ], [ 0, %for.body88.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.end104 ], [ %0, %for.body88.preheader ]
  %i.27.in = phi i32 [ %i.27, %for.end104 ], [ %n, %for.body88.preheader ]
  %43 = add i64 %27, %indvar
  %indvars.iv.next32 = add i64 %indvars.iv31, -1
  %i.27 = add nsw i32 %i.27.in, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next32
  %44 = load double, double* %arrayidx90, align 8
  %cmp921 = icmp slt i32 %i.27.in, %n
  br i1 %cmp921, label %for.inc102.preheader, label %for.end104

for.inc102.preheader:                             ; preds = %for.body88
  %45 = add i64 %26, %indvar
  %xtraiter = and i64 %45, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv29.prol = phi i64 [ %indvars.iv.next30.prol, %for.inc102.prol ], [ %indvars.iv31, %for.inc102.prol.preheader ]
  %w.33.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %44, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv29.prol
  %46 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv29.prol
  %47 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %46, %47
  %sub101.prol = fsub double %w.33.prol, %mul100.prol
  %indvars.iv.next30.prol = add i64 %indvars.iv29.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !24

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv29.unr = phi i64 [ %indvars.iv31, %for.inc102.preheader ], [ %indvars.iv.next30.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.33.unr = phi double [ %44, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %43, 3
  br i1 %48, label %for.end104, label %for.inc102.preheader.new

for.inc102.preheader.new:                         ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.preheader.new
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr, %for.inc102.preheader.new ], [ %indvars.iv.next30.3, %for.inc102 ]
  %w.33 = phi double [ %w.33.unr, %for.inc102.preheader.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv29
  %49 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv29
  %50 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %49, %50
  %sub101 = fsub double %w.33, %mul100
  %indvars.iv.next30 = add i64 %indvars.iv29, 1
  %arrayidx97.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv.next30
  %51 = load double, double* %arrayidx97.1, align 8
  %arrayidx99.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next30
  %52 = load double, double* %arrayidx99.1, align 8
  %mul100.1 = fmul double %51, %52
  %sub101.1 = fsub double %sub101, %mul100.1
  %indvars.iv.next30.1 = add i64 %indvars.iv29, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv.next30.1
  %53 = load double, double* %arrayidx97.2, align 8
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next30.1
  %54 = load double, double* %arrayidx99.2, align 8
  %mul100.2 = fmul double %53, %54
  %sub101.2 = fsub double %sub101.1, %mul100.2
  %indvars.iv.next30.2 = add i64 %indvars.iv29, 3
  %arrayidx97.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv.next30.2
  %55 = load double, double* %arrayidx97.3, align 8
  %arrayidx99.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next30.2
  %56 = load double, double* %arrayidx99.3, align 8
  %mul100.3 = fmul double %55, %56
  %sub101.3 = fsub double %sub101.2, %mul100.3
  %exitcond.3 = icmp eq i64 %indvars.iv.next30.2, %wide.trip.count
  %indvars.iv.next30.3 = add i64 %indvars.iv29, 4
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.inc102

for.end104.loopexit:                              ; preds = %for.inc102
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %44, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv.next32
  %57 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %57
  %sunkaddr63 = shl i64 %indvars.iv31, 3
  %sunkaddr64 = add i64 %28, %sunkaddr63
  %sunkaddr65 = add i64 %sunkaddr64, -8
  %sunkaddr66 = inttoptr i64 %sunkaddr65 to double*
  store double %div109, double* %sunkaddr66, align 8
  %cmp87 = icmp sgt i64 %indvars.iv31, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.end104
  br label %for.end113

for.end113:                                       ; preds = %for.end113.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
!21 = distinct !{!21, !2}
!22 = distinct !{!22, !12, !13}
!23 = distinct !{!23, !2}
!24 = distinct !{!24, !2}

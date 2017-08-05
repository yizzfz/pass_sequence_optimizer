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
  %cmp21 = icmp sgt i32 %n, 0
  br i1 %cmp21, label %entry.for.inc_crit_edge, label %for.end46.thread

entry.for.inc_crit_edge:                          ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = and i64 %1, 1
  %lcmp.mod154 = icmp eq i64 %2, 0
  br i1 %lcmp.mod154, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %entry.for.inc_crit_edge
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %entry.for.inc_crit_edge
  %indvars.iv78.unr = phi i64 [ 0, %entry.for.inc_crit_edge ], [ 1, %for.inc.prol ]
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %for.cond9.preheader, label %entry.for.inc_crit_edge.new

entry.for.inc_crit_edge.new:                      ; preds = %for.inc.prol.loopexit
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv, i32 1
  br label %for.inc

for.cond9.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.loopexit, %for.inc.prol.loopexit
  %cmp1019 = icmp sgt i32 %n, 0
  br i1 %cmp1019, label %for.cond9.preheader.for.cond13.preheader_crit_edge, label %for.end46.thread

for.cond9.preheader.for.cond13.preheader_crit_edge: ; preds = %for.cond9.preheader
  %4 = add i32 %n, -2
  %5 = zext i32 %4 to i64
  %6 = sext i32 %n to i64
  %7 = sext i32 %n to i64
  br label %for.inc25.lr.ph

for.inc:                                          ; preds = %for.inc, %entry.for.inc_crit_edge.new
  %indvars.iv78 = phi i64 [ %indvars.iv78.unr, %entry.for.inc_crit_edge.new ], [ %indvars.iv.next79.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv78
  %8 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv78
  %9 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %10 = trunc i64 %indvars.iv.next79 to i32
  %conv4 = sitofp i32 %10 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv78
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78, 2
  %11 = trunc i64 %indvars.iv.next79.1 to i32
  %conv4.1 = sitofp i32 %11 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %12 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %12, align 8
  %exitcond102.1 = icmp eq i64 %indvars.iv.next79, %1
  br i1 %exitcond102.1, label %for.cond9.preheader.loopexit, label %for.inc

for.inc25.lr.ph:                                  ; preds = %for.inc44, %for.cond9.preheader.for.cond13.preheader_crit_edge
  %indvars.iv76 = phi i64 [ 0, %for.cond9.preheader.for.cond13.preheader_crit_edge ], [ %indvars.iv.next77, %for.inc44 ]
  %13 = shl i64 %indvars.iv76, 32
  %sext = add nuw nsw i64 %13, 4294967296
  %14 = ashr exact i64 %sext, 32
  %scevgep74 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %14
  %15 = sub nsw i64 %5, %indvars.iv76
  %16 = shl i64 %15, 3
  %17 = and i64 %16, 34359738360
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %18 = sub nsw i64 0, %indvars.iv60
  %19 = trunc i64 %18 to i32
  %rem = srem i32 %19, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv60
  store double %add20, double* %arrayidx24, align 8
  %exitcond66 = icmp eq i64 %indvars.iv60, %indvars.iv76
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  br i1 %exitcond66, label %for.end27, label %for.inc25

for.end27:                                        ; preds = %for.inc25
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %cmp3017 = icmp slt i64 %indvars.iv.next77, %6
  br i1 %cmp3017, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc37.for.inc44_crit_edge:                    ; preds = %for.end27
  %20 = add nuw nsw i64 %17, 8
  %scevgep7475 = bitcast double* %scevgep74 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep7475, i8 0, i64 %20, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.end27, %for.inc37.for.inc44_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv76
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond101 = icmp eq i64 %indvars.iv.next77, %7
  br i1 %exitcond101, label %for.end46, label %for.inc25.lr.ph

for.end46.thread:                                 ; preds = %for.cond9.preheader, %entry
  %call85 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %cmp4813 = icmp sgt i32 %n, 0
  br i1 %cmp4813, label %for.end46.for.cond51.preheader.us_crit_edge, label %for.end120

for.end46.for.cond51.preheader.us_crit_edge:      ; preds = %for.end46
  %21 = add i32 %n, -1
  %22 = zext i32 %21 to i64
  %23 = shl nuw nsw i64 %22, 3
  %24 = add nuw nsw i64 %23, 8
  %25 = sext i32 %n to i64
  %26 = add nsw i64 %25, -1
  %xtraiter150 = and i64 %25, 7
  %lcmp.mod151 = icmp eq i64 %xtraiter150, 0
  br i1 %lcmp.mod151, label %for.inc62.us.prol.loopexit, label %for.inc62.us.prol.preheader

for.inc62.us.prol.preheader:                      ; preds = %for.end46.for.cond51.preheader.us_crit_edge
  br label %for.inc62.us.prol

for.inc62.us.prol:                                ; preds = %for.inc62.us.prol, %for.inc62.us.prol.preheader
  %indvars.iv58.prol = phi i64 [ 0, %for.inc62.us.prol.preheader ], [ %indvars.iv.next59.prol, %for.inc62.us.prol ]
  %prol.iter152 = phi i64 [ %xtraiter150, %for.inc62.us.prol.preheader ], [ %prol.iter152.sub, %for.inc62.us.prol ]
  %27 = mul nuw nsw i64 %indvars.iv58.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter152.sub = add i64 %prol.iter152, -1
  %prol.iter152.cmp = icmp eq i64 %prol.iter152.sub, 0
  br i1 %prol.iter152.cmp, label %for.inc62.us.prol.loopexit.loopexit, label %for.inc62.us.prol, !llvm.loop !1

for.inc62.us.prol.loopexit.loopexit:              ; preds = %for.inc62.us.prol
  br label %for.inc62.us.prol.loopexit

for.inc62.us.prol.loopexit:                       ; preds = %for.inc62.us.prol.loopexit.loopexit, %for.end46.for.cond51.preheader.us_crit_edge
  %indvars.iv58.unr = phi i64 [ 0, %for.end46.for.cond51.preheader.us_crit_edge ], [ %indvars.iv.next59.prol, %for.inc62.us.prol.loopexit.loopexit ]
  %28 = icmp ult i64 %26, 7
  br i1 %28, label %for.cond65.preheader, label %for.end46.for.cond51.preheader.us_crit_edge.new

for.end46.for.cond51.preheader.us_crit_edge.new:  ; preds = %for.inc62.us.prol.loopexit
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46.for.cond51.preheader.us_crit_edge.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr, %for.end46.for.cond51.preheader.us_crit_edge.new ], [ %indvars.iv.next59.7, %for.inc62.us ]
  %29 = mul nuw nsw i64 %indvars.iv58, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %24, i32 8, i1 false)
  %30 = mul i64 %indvars.iv58, 16000
  %31 = add i64 %30, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %24, i32 8, i1 false)
  %32 = mul i64 %indvars.iv58, 16000
  %33 = add i64 %32, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %24, i32 8, i1 false)
  %34 = mul i64 %indvars.iv58, 16000
  %35 = add i64 %34, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %24, i32 8, i1 false)
  %36 = mul i64 %indvars.iv58, 16000
  %37 = add i64 %36, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %24, i32 8, i1 false)
  %38 = mul i64 %indvars.iv58, 16000
  %39 = add i64 %38, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %24, i32 8, i1 false)
  %40 = mul i64 %indvars.iv58, 16000
  %41 = add i64 %40, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %24, i32 8, i1 false)
  %42 = mul i64 %indvars.iv58, 16000
  %43 = add i64 %42, 112000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %24, i32 8, i1 false)
  %indvars.iv.next59.7 = add nsw i64 %indvars.iv58, 8
  %exitcond100.7 = icmp eq i64 %indvars.iv.next59.7, %25
  br i1 %exitcond100.7, label %for.cond65.preheader.loopexit, label %for.inc62.us

for.cond65.preheader.loopexit:                    ; preds = %for.inc62.us
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond65.preheader.loopexit, %for.inc62.us.prol.loopexit
  %cmp669 = icmp sgt i32 %n, 0
  br i1 %cmp669, label %for.cond69.preheader.lr.ph, label %for.end120

for.cond69.preheader.lr.ph:                       ; preds = %for.cond65.preheader
  %44 = add i32 %n, -1
  %45 = sext i32 %n to i64
  %46 = zext i32 %44 to i64
  %47 = add nuw nsw i64 %1, 1
  %48 = shl nuw nsw i64 %1, 3
  %49 = add nuw nsw i64 %48, 8
  %50 = add nuw nsw i64 %1, 1
  %min.iters.check = icmp ult i64 %47, 4
  %51 = bitcast i8* %call to [2000 x [2000 x double]]*
  %52 = bitcast i8* %call to [2000 x [2000 x double]]*
  %53 = bitcast i8* %call to [2000 x [2000 x double]]*
  %n.vec = and i64 %47, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n = icmp eq i64 %47, %n.vec
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph
  %indvars.iv52 = phi i64 [ 0, %for.cond69.preheader.lr.ph ], [ %indvars.iv.next53, %for.inc96.us ]
  %scevgep105 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv52
  %55 = add i64 %indvars.iv52, 1
  %scevgep107 = getelementptr [2000 x double], [2000 x double]* %A, i64 %1, i64 %55
  %56 = bitcast double* %scevgep107 to i8*
  %57 = bitcast double* %scevgep105 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next53, %45
  br i1 %exitcond99, label %for.cond99.preheader, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv50 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next51, %for.inc93.us.us ]
  %58 = mul i64 %indvars.iv50, 16000
  %scevgep103 = getelementptr i8, i8* %call, i64 %58
  %59 = add i64 %49, %58
  %scevgep104 = getelementptr i8, i8* %call, i64 %59
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv52
  br i1 %min.iters.check, label %for.inc90.us.us.preheader, label %min.iters.checked

for.inc90.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond73.preheader.us.us
  %indvars.iv46.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond73.preheader.us.us ], [ %n.vec, %middle.block ]
  %60 = sub nsw i64 %50, %indvars.iv46.ph
  %xtraiter148 = and i64 %60, 1
  %lcmp.mod149 = icmp eq i64 %xtraiter148, 0
  br i1 %lcmp.mod149, label %for.inc90.us.us.prol.loopexit, label %for.inc90.us.us.prol

for.inc90.us.us.prol:                             ; preds = %for.inc90.us.us.preheader
  %61 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46.ph, i64 %indvars.iv52
  %62 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %61, %62
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %53, i64 0, i64 %indvars.iv50, i64 %indvars.iv46.ph
  %63 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %63, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next47.prol = or i64 %indvars.iv46.ph, 1
  br label %for.inc90.us.us.prol.loopexit

for.inc90.us.us.prol.loopexit:                    ; preds = %for.inc90.us.us.prol, %for.inc90.us.us.preheader
  %indvars.iv46.unr.ph = phi i64 [ %indvars.iv.next47.prol, %for.inc90.us.us.prol ], [ %indvars.iv46.ph, %for.inc90.us.us.preheader ]
  %64 = icmp eq i64 %1, %indvars.iv46.ph
  br i1 %64, label %for.inc93.us.us, label %for.inc90.us.us.preheader.new

for.inc90.us.us.preheader.new:                    ; preds = %for.inc90.us.us.prol.loopexit
  br label %for.inc90.us.us

min.iters.checked:                                ; preds = %for.cond73.preheader.us.us
  br i1 %cmp.zero, label %for.inc90.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep103, %56
  %bound1 = icmp ult i8* %57, %scevgep104
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bc109 = bitcast double* %arrayidx80.us.us to i8*
  %bound0110 = icmp ult i8* %scevgep103, %bc109
  %bound1111 = icmp ult i8* %bc, %scevgep104
  %found.conflict112 = and i1 %bound0110, %bound1111
  %conflict.rdx = or i1 %found.conflict, %found.conflict112
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %65 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !3
  %66 = insertelement <2 x double> undef, double %65, i32 0
  %67 = shufflevector <2 x double> %66, <2 x double> undef, <2 x i32> zeroinitializer
  %68 = insertelement <2 x double> undef, double %65, i32 0
  %69 = shufflevector <2 x double> %68, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %70 = or i64 %index, 1
  %71 = or i64 %index, 2
  %72 = or i64 %index, 3
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv52
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %70, i64 %indvars.iv52
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %71, i64 %indvars.iv52
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %72, i64 %indvars.iv52
  %77 = load double, double* %73, align 8, !alias.scope !6
  %78 = load double, double* %74, align 8, !alias.scope !6
  %79 = load double, double* %75, align 8, !alias.scope !6
  %80 = load double, double* %76, align 8, !alias.scope !6
  %81 = insertelement <2 x double> undef, double %77, i32 0
  %82 = insertelement <2 x double> %81, double %78, i32 1
  %83 = insertelement <2 x double> undef, double %79, i32 0
  %84 = insertelement <2 x double> %83, double %80, i32 1
  %85 = fmul <2 x double> %67, %82
  %86 = fmul <2 x double> %69, %84
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv50, i64 %index
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !8, !noalias !10
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !8, !noalias !10
  %91 = fadd <2 x double> %wide.load, %85
  %92 = fadd <2 x double> %wide.load114, %86
  %93 = bitcast double* %87 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8, !alias.scope !8, !noalias !10
  %94 = bitcast double* %89 to <2 x double>*
  store <2 x double> %92, <2 x double>* %94, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %95 = icmp eq i64 %index.next, %n.vec
  br i1 %95, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit, %middle.block
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next51, %45
  br i1 %exitcond98, label %for.inc96.us, label %for.cond73.preheader.us.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr.ph, %for.inc90.us.us.preheader.new ], [ %indvars.iv.next47.1, %for.inc90.us.us ]
  %96 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv52
  %97 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %96, %97
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv50, i64 %indvars.iv46
  %98 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %98, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %99 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv52
  %100 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %99, %100
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next47
  %101 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %101, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond97.1 = icmp eq i64 %indvars.iv.next47, %46
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  br i1 %exitcond97.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !14

for.cond99.preheader:                             ; preds = %for.inc96.us
  %cmp1003 = icmp sgt i32 %n, 0
  br i1 %cmp1003, label %for.cond99.preheader.for.cond103.preheader.us_crit_edge, label %for.end120

for.cond99.preheader.for.cond103.preheader.us_crit_edge: ; preds = %for.cond99.preheader
  %102 = add i32 %n, -1
  %103 = sext i32 %n to i64
  %104 = zext i32 %102 to i64
  %105 = add nuw nsw i64 %1, 1
  %106 = shl nuw nsw i64 %1, 3
  %107 = add nuw nsw i64 %106, 8
  %108 = and i64 %47, 8589934588
  %109 = add nsw i64 %108, -4
  %110 = lshr exact i64 %109, 2
  %111 = add nuw nsw i64 %1, 1
  %min.iters.check118 = icmp ult i64 %105, 4
  %112 = bitcast i8* %call to [2000 x [2000 x double]]*
  %113 = bitcast i8* %call to [2000 x [2000 x double]]*
  %114 = bitcast i8* %call to [2000 x [2000 x double]]*
  %115 = bitcast i8* %call to [2000 x [2000 x double]]*
  %116 = bitcast i8* %call to [2000 x [2000 x double]]*
  %n.vec121 = and i64 %105, 8589934588
  %cmp.zero122 = icmp eq i64 %n.vec121, 0
  %117 = and i64 %110, 1
  %lcmp.mod = icmp eq i64 %117, 0
  %118 = bitcast i8* %call to [2000 x [2000 x double]]*
  %119 = icmp eq i64 %110, 0
  %cmp.n139 = icmp eq i64 %105, %n.vec121
  %120 = bitcast i8* %call to [2000 x [2000 x double]]*
  %121 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond99.preheader.for.cond103.preheader.us_crit_edge
  %indvars.iv44 = phi i64 [ 0, %for.cond99.preheader.for.cond103.preheader.us_crit_edge ], [ %indvars.iv.next45, %for.inc118.us ]
  %scevgep124 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 0
  %scevgep126 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %105
  %122 = mul i64 %indvars.iv44, 16000
  %scevgep128 = getelementptr i8, i8* %call, i64 %122
  %123 = add i64 %107, %122
  %scevgep129 = getelementptr i8, i8* %call, i64 %123
  br i1 %min.iters.check118, label %for.inc115.us.preheader, label %min.iters.checked119

min.iters.checked119:                             ; preds = %for.cond103.preheader.us
  br i1 %cmp.zero122, label %for.inc115.us.preheader, label %vector.memcheck134

vector.memcheck134:                               ; preds = %min.iters.checked119
  %124 = bitcast double* %scevgep126 to i8*
  %125 = bitcast double* %scevgep124 to i8*
  %bound0130 = icmp ult i8* %125, %scevgep129
  %bound1131 = icmp ult i8* %scevgep128, %124
  %memcheck.conflict133 = and i1 %bound0130, %bound1131
  br i1 %memcheck.conflict133, label %for.inc115.us.preheader, label %vector.body115.preheader

vector.body115.preheader:                         ; preds = %vector.memcheck134
  br i1 %lcmp.mod, label %vector.body115.prol, label %vector.body115.prol.loopexit

vector.body115.prol:                              ; preds = %vector.body115.preheader
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %118, i64 0, i64 %indvars.iv44, i64 0
  %127 = bitcast double* %126 to <2 x i64>*
  %wide.load144.prol = load <2 x i64>, <2 x i64>* %127, align 8, !alias.scope !15
  %128 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %118, i64 0, i64 %indvars.iv44, i64 2
  %129 = bitcast double* %128 to <2 x i64>*
  %wide.load145.prol = load <2 x i64>, <2 x i64>* %129, align 8, !alias.scope !15
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 0
  %131 = bitcast double* %130 to <2 x i64>*
  store <2 x i64> %wide.load144.prol, <2 x i64>* %131, align 8, !alias.scope !18, !noalias !15
  %132 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 2
  %133 = bitcast double* %132 to <2 x i64>*
  store <2 x i64> %wide.load145.prol, <2 x i64>* %133, align 8, !alias.scope !18, !noalias !15
  br label %vector.body115.prol.loopexit

vector.body115.prol.loopexit:                     ; preds = %vector.body115.prol, %vector.body115.preheader
  %index136.unr.ph = phi i64 [ 4, %vector.body115.prol ], [ 0, %vector.body115.preheader ]
  br i1 %119, label %middle.block116, label %vector.body115.preheader.new

vector.body115.preheader.new:                     ; preds = %vector.body115.prol.loopexit
  br label %vector.body115

vector.body115:                                   ; preds = %vector.body115, %vector.body115.preheader.new
  %index136 = phi i64 [ %index136.unr.ph, %vector.body115.preheader.new ], [ %index.next137.1, %vector.body115 ]
  %134 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %120, i64 0, i64 %indvars.iv44, i64 %index136
  %135 = bitcast double* %134 to <2 x i64>*
  %wide.load144 = load <2 x i64>, <2 x i64>* %135, align 8, !alias.scope !15
  %136 = getelementptr double, double* %134, i64 2
  %137 = bitcast double* %136 to <2 x i64>*
  %wide.load145 = load <2 x i64>, <2 x i64>* %137, align 8, !alias.scope !15
  %138 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %index136
  %139 = bitcast double* %138 to <2 x i64>*
  store <2 x i64> %wide.load144, <2 x i64>* %139, align 8, !alias.scope !18, !noalias !15
  %140 = getelementptr double, double* %138, i64 2
  %141 = bitcast double* %140 to <2 x i64>*
  store <2 x i64> %wide.load145, <2 x i64>* %141, align 8, !alias.scope !18, !noalias !15
  %index.next137 = add i64 %index136, 4
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %121, i64 0, i64 %indvars.iv44, i64 %index.next137
  %143 = bitcast double* %142 to <2 x i64>*
  %wide.load144.1 = load <2 x i64>, <2 x i64>* %143, align 8, !alias.scope !15
  %144 = getelementptr double, double* %142, i64 2
  %145 = bitcast double* %144 to <2 x i64>*
  %wide.load145.1 = load <2 x i64>, <2 x i64>* %145, align 8, !alias.scope !15
  %146 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %index.next137
  %147 = bitcast double* %146 to <2 x i64>*
  store <2 x i64> %wide.load144.1, <2 x i64>* %147, align 8, !alias.scope !18, !noalias !15
  %148 = getelementptr double, double* %146, i64 2
  %149 = bitcast double* %148 to <2 x i64>*
  store <2 x i64> %wide.load145.1, <2 x i64>* %149, align 8, !alias.scope !18, !noalias !15
  %index.next137.1 = add i64 %index136, 8
  %150 = icmp eq i64 %index.next137.1, %n.vec121
  br i1 %150, label %middle.block116.loopexit, label %vector.body115, !llvm.loop !20

middle.block116.loopexit:                         ; preds = %vector.body115
  br label %middle.block116

middle.block116:                                  ; preds = %middle.block116.loopexit, %vector.body115.prol.loopexit
  br i1 %cmp.n139, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %middle.block116, %vector.memcheck134, %min.iters.checked119, %for.cond103.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck134 ], [ 0, %min.iters.checked119 ], [ 0, %for.cond103.preheader.us ], [ %n.vec121, %middle.block116 ]
  %151 = sub nsw i64 %111, %indvars.iv.ph
  %152 = sub nsw i64 %1, %indvars.iv.ph
  %xtraiter146 = and i64 %151, 3
  %lcmp.mod147 = icmp eq i64 %xtraiter146, 0
  br i1 %lcmp.mod147, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.inc115.us.preheader
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol, %for.inc115.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ %indvars.iv.ph, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter146, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %116, i64 0, i64 %indvars.iv44, i64 %indvars.iv.prol
  %153 = bitcast double* %arrayidx110.us.prol to i64*
  %154 = load i64, i64* %153, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.prol
  %155 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %154, i64* %155, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !21

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.inc115.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc115.us.preheader ], [ %indvars.iv.next.prol, %for.inc115.us.prol.loopexit.loopexit ]
  %156 = icmp ult i64 %152, 3
  br i1 %156, label %for.inc118.us, label %for.inc115.us.preheader.new

for.inc115.us.preheader.new:                      ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc115.us.preheader.new ], [ %indvars.iv.next.3, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %112, i64 0, i64 %indvars.iv44, i64 %indvars.iv
  %157 = bitcast double* %arrayidx110.us to i64*
  %158 = load i64, i64* %157, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv
  %159 = bitcast double* %arrayidx114.us to i64*
  store i64 %158, i64* %159, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %113, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next
  %160 = bitcast double* %arrayidx110.us.1 to i64*
  %161 = load i64, i64* %160, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next
  %162 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %161, i64* %162, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %114, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %163 = bitcast double* %arrayidx110.us.2 to i64*
  %164 = load i64, i64* %163, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %165 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %164, i64* %165, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %115, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %166 = bitcast double* %arrayidx110.us.3 to i64*
  %167 = load i64, i64* %166, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %168 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %167, i64* %168, align 8
  %exitcond96.3 = icmp eq i64 %indvars.iv.next.2, %104
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond96.3, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !22

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit, %middle.block116
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, %103
  br i1 %exitcond, label %for.end120.loopexit, label %for.cond103.preheader.us

for.end120.loopexit:                              ; preds = %for.inc118.us
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.end46.thread, %for.end46, %for.cond65.preheader, %for.cond99.preheader
  %call879094 = phi i8* [ %call, %for.cond99.preheader ], [ %call, %for.cond65.preheader ], [ %call, %for.end46 ], [ %call85, %for.end46.thread ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call879094) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %entry.for.cond1.preheader_crit_edge, label %for.end113

entry.for.cond1.preheader_crit_edge:              ; preds = %entry
  %0 = sext i32 %n to i64
  %1 = sext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry.for.cond1.preheader_crit_edge
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.inc58 ], [ 4294967295, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc58 ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %2 = and i64 %indvars.iv69, 4294967295
  %cmp218 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp218, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 0
  br label %for.body3

for.cond61.preheader:                             ; preds = %for.inc58
  %cmp6212 = icmp sgt i32 %n, 0
  br i1 %cmp6212, label %for.cond61.preheader.for.body63_crit_edge, label %for.end113

for.cond61.preheader.for.body63_crit_edge:        ; preds = %for.cond61.preheader
  %3 = sext i32 %n to i64
  br label %for.body63

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3620 = icmp sgt i64 %indvars.iv58, 0
  br i1 %cmp3620, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %4 = and i64 %indvars.iv69, 1
  %lcmp.mod82 = icmp eq i64 %4, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 0
  %5 = icmp eq i64 %2, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.inc55.us ], [ %indvars.iv58, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv56
  %6 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod82, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %7 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv56
  %8 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %7, %8
  %sub47.us.prol = fsub double %6, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv48.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.122.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %6, %for.body30.us ]
  br i1 %5, label %for.inc55.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %for.body30.us.new ], [ %indvars.iv.next49.1, %for.inc48.us ]
  %w.122.us = phi double [ %w.122.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv48
  %9 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv48, i64 %indvars.iv56
  %10 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %11 = load <2 x double>, <2 x double>* %9, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next49, i64 %indvars.iv56
  %12 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %10, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %12, i32 1
  %mul46.us = fmul <2 x double> %11, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.122.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next49, %2
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  br i1 %exitcond71.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next57 = add nuw i64 %indvars.iv56, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next57, %0
  br i1 %cmp29.us, label %for.body30.us, label %for.inc58.loopexit

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc25 ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.inc25 ], [ 0, %for.body3.preheader ]
  %13 = and i64 %indvars.iv66, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv45
  %14 = load double, double* %arrayidx5, align 8
  %cmp714 = icmp sgt i64 %indvars.iv45, 0
  br i1 %cmp714, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %15 = and i64 %indvars.iv66, 1
  %lcmp.mod80 = icmp eq i64 %15, 0
  br i1 %lcmp.mod80, label %for.inc.prol, label %for.inc.prol.loopexit

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
  br i1 %18, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv39 = phi i64 [ %indvars.iv39.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next40.1, %for.inc ]
  %w.016 = phi double [ %w.016.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv39
  %19 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv45
  %20 = load double, double* %arrayidx16, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %21 = load <2 x double>, <2 x double>* %19, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next40, i64 %indvars.iv45
  %22 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %20, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %22, i32 1
  %mul = fmul <2 x double> %21, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.016, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond68.1 = icmp eq i64 %indvars.iv.next40, %13
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  br i1 %exitcond68.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %14, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv45
  %23 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %23
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next46 = add nuw i64 %indvars.iv45, 1
  %cmp2 = icmp slt i64 %indvars.iv.next46, %indvars.iv58
  %indvars.iv.next67 = add nuw nsw i64 %13, 1
  br i1 %cmp2, label %for.body3, label %for.body30.lr.ph

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader, %for.body30.lr.ph
  %indvars.iv.next59 = add nuw i64 %indvars.iv58, 1
  %cmp = icmp slt i64 %indvars.iv.next59, %1
  %indvars.iv.next70 = add nuw nsw i64 %2, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond61.preheader

for.cond86.preheader:                             ; preds = %for.inc82
  %cmp876 = icmp sgt i32 %n, 0
  br i1 %cmp876, label %for.cond86.preheader.for.body88_crit_edge, label %for.end113

for.cond86.preheader.for.body88_crit_edge:        ; preds = %for.cond86.preheader
  %24 = sext i32 %n to i64
  %25 = add i32 %n, -1
  %26 = sext i32 %n to i64
  %wide.trip.count = sext i32 %25 to i64
  %27 = add nsw i64 %wide.trip.count, 1
  %28 = sub nsw i64 %27, %1
  %29 = sub nsw i64 %wide.trip.count, %1
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body63:                                       ; preds = %for.inc82, %for.cond61.preheader.for.body63_crit_edge
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc82 ], [ 4294967295, %for.cond61.preheader.for.body63_crit_edge ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.inc82 ], [ 0, %for.cond61.preheader.for.body63_crit_edge ]
  %30 = and i64 %indvars.iv63, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv37
  %31 = load double, double* %arrayidx65, align 8
  %cmp678 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp678, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %32 = add nsw i64 %indvars.iv63, 1
  %xtraiter76 = and i64 %32, 3
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  br i1 %lcmp.mod77, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.210.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %31, %for.inc77.prol.preheader ]
  %prol.iter78 = phi i64 [ %prol.iter78.sub, %for.inc77.prol ], [ %xtraiter76, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.prol
  %33 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %34 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %33, %34
  %sub76.prol = fsub double %w.210.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter78.sub = add i64 %prol.iter78, -1
  %prol.iter78.cmp = icmp eq i64 %prol.iter78.sub, 0
  br i1 %prol.iter78.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !23

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.210.unr = phi double [ %31, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %35 = icmp ult i64 %30, 3
  br i1 %35, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc77.preheader.new ], [ %indvars.iv.next.3, %for.inc77 ]
  %w.210 = phi double [ %w.210.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv
  %36 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %37 = bitcast double* %arrayidx74 to <2 x double>*
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %39 = load <2 x double>, <2 x double>* %37, align 8
  %mul75 = fmul <2 x double> %38, %39
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.210, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next.1
  %40 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %41 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %42 = load <2 x double>, <2 x double>* %40, align 8
  %43 = load <2 x double>, <2 x double>* %41, align 8
  %mul75.2 = fmul <2 x double> %42, %43
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond65.3 = icmp eq i64 %indvars.iv.next.2, %30
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond65.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %31, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv37
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next38 = add nuw i64 %indvars.iv37, 1
  %cmp62 = icmp slt i64 %indvars.iv.next38, %3
  %indvars.iv.next64 = add nuw nsw i64 %30, 1
  br i1 %cmp62, label %for.body63, label %for.cond86.preheader

for.body88:                                       ; preds = %for.inc112, %for.cond86.preheader.for.body88_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.inc112 ], [ 0, %for.cond86.preheader.for.body88_crit_edge ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc112 ], [ %24, %for.cond86.preheader.for.body88_crit_edge ]
  %44 = add i64 %29, %indvar
  %indvars.iv.next32 = add nsw i64 %indvars.iv31, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next32
  %45 = load double, double* %arrayidx90, align 8
  %cmp922 = icmp slt i64 %indvars.iv31, %26
  br i1 %cmp922, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %46 = add i64 %28, %indvar
  %xtraiter = and i64 %46, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv29.prol = phi i64 [ %indvars.iv.next30.prol, %for.inc102.prol ], [ %indvars.iv31, %for.inc102.prol.preheader ]
  %w.33.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %45, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv29.prol
  %47 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv29.prol
  %48 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %47, %48
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
  %w.33.unr = phi double [ %45, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %49 = icmp ult i64 %44, 3
  br i1 %49, label %for.inc112, label %for.inc102.preheader.new

for.inc102.preheader.new:                         ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.preheader.new
  %indvars.iv29 = phi i64 [ %indvars.iv29.unr, %for.inc102.preheader.new ], [ %indvars.iv.next30.3, %for.inc102 ]
  %w.33 = phi double [ %w.33.unr, %for.inc102.preheader.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv29
  %50 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv29
  %51 = bitcast double* %arrayidx99 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %53 = load <2 x double>, <2 x double>* %51, align 8
  %mul100 = fmul <2 x double> %52, %53
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.33, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next30.1 = add i64 %indvars.iv29, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv.next30.1
  %54 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next30.1
  %55 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next30.2 = add i64 %indvars.iv29, 3
  %56 = load <2 x double>, <2 x double>* %54, align 8
  %57 = load <2 x double>, <2 x double>* %55, align 8
  %mul100.2 = fmul <2 x double> %56, %57
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next30.2, %wide.trip.count
  %indvars.iv.next30.3 = add i64 %indvars.iv29, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %45, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next32, i64 %indvars.iv.next32
  %58 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %58
  %sunkaddr72 = shl i64 %indvars.iv31, 3
  %sunkaddr73 = add i64 %sunkaddr, %sunkaddr72
  %sunkaddr74 = add i64 %sunkaddr73, -8
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  store double %div109, double* %sunkaddr75, align 8
  %cmp87 = icmp sgt i64 %indvars.iv31, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.inc112
  br label %for.end113

for.end113:                                       ; preds = %for.end113.loopexit, %entry, %for.cond61.preheader, %for.cond86.preheader
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
  br i1 %cmp1, label %entry.for.body_crit_edge, label %for.end

entry.for.body_crit_edge:                         ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry.for.body_crit_edge
  %indvars.iv = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next, %for.inc ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
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

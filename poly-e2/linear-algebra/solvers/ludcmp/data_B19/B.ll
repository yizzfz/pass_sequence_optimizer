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
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %conv = sitofp i32 %n to double
  %cmp83 = icmp sgt i32 %n, 0
  br i1 %cmp83, label %entry.for.inc_crit_edge, label %for.end46.thread

entry.for.inc_crit_edge:                          ; preds = %entry
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = and i64 %1, 1
  %lcmp.mod212 = icmp eq i64 %2, 0
  br i1 %lcmp.mod212, label %for.inc.prol.preheader, label %for.inc.prol.loopexit

for.inc.prol.preheader:                           ; preds = %entry.for.inc_crit_edge
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.preheader, %entry.for.inc_crit_edge
  %indvars.iv140.unr = phi i64 [ 0, %entry.for.inc_crit_edge ], [ 1, %for.inc.prol.preheader ]
  %3 = icmp eq i32 %0, 0
  br i1 %3, label %for.cond9.preheader.for.cond13.preheader_crit_edge, label %entry.for.inc_crit_edge.new

entry.for.inc_crit_edge.new:                      ; preds = %for.inc.prol.loopexit
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv, i32 1
  br label %for.inc

for.cond9.preheader.for.cond13.preheader_crit_edge.loopexit: ; preds = %for.inc
  br label %for.cond9.preheader.for.cond13.preheader_crit_edge

for.cond9.preheader.for.cond13.preheader_crit_edge: ; preds = %for.cond9.preheader.for.cond13.preheader_crit_edge.loopexit, %for.inc.prol.loopexit
  %4 = add i32 %n, -2
  %5 = zext i32 %4 to i64
  %6 = sext i32 %n to i64
  br label %for.inc25.lr.ph

for.inc:                                          ; preds = %for.inc, %entry.for.inc_crit_edge.new
  %indvars.iv140 = phi i64 [ %indvars.iv140.unr, %entry.for.inc_crit_edge.new ], [ %indvars.iv.next141.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv140
  %7 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv140
  %8 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %9 = trunc i64 %indvars.iv.next141 to i32
  %conv4 = sitofp i32 %9 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv140
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  store <2 x double> zeroinitializer, <2 x double>* %8, align 8
  %indvars.iv.next141.1 = add nsw i64 %indvars.iv140, 2
  %10 = trunc i64 %indvars.iv.next141.1 to i32
  %conv4.1 = sitofp i32 %10 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %11 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %11, align 8
  %exitcond160.1 = icmp eq i64 %indvars.iv.next141, %1
  br i1 %exitcond160.1, label %for.cond9.preheader.for.cond13.preheader_crit_edge.loopexit, label %for.inc

for.inc25.lr.ph:                                  ; preds = %for.inc44, %for.cond9.preheader.for.cond13.preheader_crit_edge
  %indvars.iv138 = phi i64 [ 0, %for.cond9.preheader.for.cond13.preheader_crit_edge ], [ %indvars.iv.next139, %for.inc44 ]
  %12 = shl i64 %indvars.iv138, 32
  %sext = add i64 %12, 4294967296
  %13 = ashr exact i64 %sext, 32
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv138, i64 %13
  %14 = sub i64 %5, %indvars.iv138
  %15 = shl i64 %14, 3
  %16 = and i64 %15, 34359738360
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %17 = sub nsw i64 0, %indvars.iv122
  %18 = trunc i64 %17 to i32
  %rem = srem i32 %18, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv138, i64 %indvars.iv122
  store double %add20, double* %arrayidx24, align 8
  %exitcond128 = icmp eq i64 %indvars.iv122, %indvars.iv138
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br i1 %exitcond128, label %for.end27, label %for.inc25

for.end27:                                        ; preds = %for.inc25
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %cmp3079 = icmp slt i64 %indvars.iv.next139, %6
  br i1 %cmp3079, label %for.inc37.for.inc44_crit_edge, label %for.inc44

for.inc37.for.inc44_crit_edge:                    ; preds = %for.end27
  %19 = add nuw nsw i64 %16, 8
  %scevgep136137 = bitcast double* %scevgep136 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep136137, i8 0, i64 %19, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.end27, %for.inc37.for.inc44_crit_edge
  %20 = icmp slt i64 %indvars.iv.next139, %6
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv138, i64 %indvars.iv138
  store double 1.000000e+00, double* %arrayidx43, align 8
  br i1 %20, label %for.inc25.lr.ph, label %for.end46.for.cond51.preheader.us_crit_edge

for.end46.thread:                                 ; preds = %entry
  %call147 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.end46.for.cond51.preheader.us_crit_edge:      ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %21 = shl nuw nsw i64 %1, 3
  %22 = add nuw nsw i64 %21, 8
  %23 = add nsw i64 %6, -1
  %xtraiter208 = and i64 %6, 7
  %lcmp.mod209 = icmp eq i64 %xtraiter208, 0
  br i1 %lcmp.mod209, label %for.inc62.us.prol.loopexit, label %for.inc62.us.prol.preheader

for.inc62.us.prol.preheader:                      ; preds = %for.end46.for.cond51.preheader.us_crit_edge
  br label %for.inc62.us.prol

for.inc62.us.prol:                                ; preds = %for.inc62.us.prol, %for.inc62.us.prol.preheader
  %indvars.iv120.prol = phi i64 [ 0, %for.inc62.us.prol.preheader ], [ %indvars.iv.next121.prol, %for.inc62.us.prol ]
  %prol.iter210 = phi i64 [ %xtraiter208, %for.inc62.us.prol.preheader ], [ %prol.iter210.sub, %for.inc62.us.prol ]
  %24 = mul nuw nsw i64 %indvars.iv120.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next121.prol = add nuw nsw i64 %indvars.iv120.prol, 1
  %prol.iter210.sub = add i64 %prol.iter210, -1
  %prol.iter210.cmp = icmp eq i64 %prol.iter210.sub, 0
  br i1 %prol.iter210.cmp, label %for.inc62.us.prol.loopexit.loopexit, label %for.inc62.us.prol, !llvm.loop !1

for.inc62.us.prol.loopexit.loopexit:              ; preds = %for.inc62.us.prol
  br label %for.inc62.us.prol.loopexit

for.inc62.us.prol.loopexit:                       ; preds = %for.inc62.us.prol.loopexit.loopexit, %for.end46.for.cond51.preheader.us_crit_edge
  %indvars.iv120.unr = phi i64 [ 0, %for.end46.for.cond51.preheader.us_crit_edge ], [ %indvars.iv.next121.prol, %for.inc62.us.prol.loopexit.loopexit ]
  %25 = icmp ult i64 %23, 7
  br i1 %25, label %for.cond69.preheader.lr.ph, label %for.end46.for.cond51.preheader.us_crit_edge.new

for.end46.for.cond51.preheader.us_crit_edge.new:  ; preds = %for.inc62.us.prol.loopexit
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46.for.cond51.preheader.us_crit_edge.new
  %indvars.iv120 = phi i64 [ %indvars.iv120.unr, %for.end46.for.cond51.preheader.us_crit_edge.new ], [ %indvars.iv.next121.7, %for.inc62.us ]
  %26 = mul i64 %indvars.iv120, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %22, i32 8, i1 false)
  %27 = add i64 %26, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %22, i32 8, i1 false)
  %28 = add i64 %26, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %22, i32 8, i1 false)
  %29 = add i64 %26, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %22, i32 8, i1 false)
  %30 = add i64 %26, 64000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 %22, i32 8, i1 false)
  %31 = add i64 %26, 80000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 %22, i32 8, i1 false)
  %32 = add i64 %26, 96000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next121.6 = add nsw i64 %indvars.iv120, 7
  %33 = mul nuw nsw i64 %indvars.iv.next121.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 %22, i32 8, i1 false)
  %indvars.iv.next121.7 = add nsw i64 %indvars.iv120, 8
  %exitcond159.7 = icmp eq i64 %indvars.iv.next121.6, %23
  br i1 %exitcond159.7, label %for.cond69.preheader.lr.ph.loopexit, label %for.inc62.us

for.cond69.preheader.lr.ph.loopexit:              ; preds = %for.inc62.us
  br label %for.cond69.preheader.lr.ph

for.cond69.preheader.lr.ph:                       ; preds = %for.cond69.preheader.lr.ph.loopexit, %for.inc62.us.prol.loopexit
  %34 = add nuw nsw i64 %1, 1
  %min.iters.check = icmp ult i64 %34, 4
  %35 = bitcast i8* %call to [2000 x [2000 x double]]*
  %36 = bitcast i8* %call to [2000 x [2000 x double]]*
  %n.vec = and i64 %34, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %37 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.n = icmp eq i64 %34, %n.vec
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.inc96.us, %for.cond69.preheader.lr.ph
  %indvars.iv114 = phi i64 [ 0, %for.cond69.preheader.lr.ph ], [ %38, %for.inc96.us ]
  %scevgep163 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv114
  %38 = add i64 %indvars.iv114, 1
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %A, i64 %1, i64 %38
  %39 = bitcast double* %scevgep165 to i8*
  %40 = bitcast double* %scevgep163 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %cmp66.us = icmp slt i64 %38, %6
  br i1 %cmp66.us, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge, label %for.cond99.preheader.for.cond103.preheader.us_crit_edge

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv112 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next113, %for.inc93.us.us ]
  %41 = mul i64 %indvars.iv112, 16000
  %scevgep161 = getelementptr i8, i8* %call, i64 %41
  %42 = add i64 %22, %41
  %scevgep162 = getelementptr i8, i8* %call, i64 %42
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv114
  br i1 %min.iters.check, label %for.inc90.us.us.preheader, label %min.iters.checked

for.inc90.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond73.preheader.us.us
  %indvars.iv108.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond73.preheader.us.us ], [ %n.vec, %middle.block ]
  %43 = sub nsw i64 %34, %indvars.iv108.ph
  %xtraiter206 = and i64 %43, 1
  %lcmp.mod207 = icmp eq i64 %xtraiter206, 0
  br i1 %lcmp.mod207, label %for.inc90.us.us.prol.loopexit.unr-lcssa, label %for.inc90.us.us.prol.preheader

for.inc90.us.us.prol.preheader:                   ; preds = %for.inc90.us.us.preheader
  %44 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108.ph, i64 %indvars.iv114
  %45 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %44, %45
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv112, i64 %indvars.iv108.ph
  %46 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %46, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  %indvars.iv.next109.prol = or i64 %indvars.iv108.ph, 1
  br label %for.inc90.us.us.prol.loopexit.unr-lcssa

for.inc90.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.inc90.us.us.preheader, %for.inc90.us.us.prol.preheader
  %indvars.iv108.unr.ph = phi i64 [ %indvars.iv.next109.prol, %for.inc90.us.us.prol.preheader ], [ %indvars.iv108.ph, %for.inc90.us.us.preheader ]
  %47 = icmp eq i64 %1, %indvars.iv108.ph
  br i1 %47, label %for.inc93.us.us, label %for.inc90.us.us.preheader.new

for.inc90.us.us.preheader.new:                    ; preds = %for.inc90.us.us.prol.loopexit.unr-lcssa
  br label %for.inc90.us.us

min.iters.checked:                                ; preds = %for.cond73.preheader.us.us
  br i1 %cmp.zero, label %for.inc90.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i8* %scevgep161, %39
  %bound1 = icmp ult i8* %40, %scevgep162
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bound0168 = icmp ult i8* %scevgep161, %bc
  %bound1169 = icmp ult i8* %bc, %scevgep162
  %found.conflict170 = and i1 %bound0168, %bound1169
  %conflict.rdx = or i1 %found.conflict, %found.conflict170
  br i1 %conflict.rdx, label %for.inc90.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %.pre = load double, double* %arrayidx80.us.us, align 8, !alias.scope !3
  %48 = insertelement <2 x double> undef, double %.pre, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %50 = or i64 %index, 1
  %51 = or i64 %index, 2
  %52 = or i64 %index, 3
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv114
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %50, i64 %indvars.iv114
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %51, i64 %indvars.iv114
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %52, i64 %indvars.iv114
  %57 = load double, double* %53, align 8, !alias.scope !6
  %58 = load double, double* %54, align 8, !alias.scope !6
  %59 = load double, double* %55, align 8, !alias.scope !6
  %60 = load double, double* %56, align 8, !alias.scope !6
  %61 = insertelement <2 x double> undef, double %57, i32 0
  %62 = insertelement <2 x double> %61, double %58, i32 1
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %60, i32 1
  %65 = fmul <2 x double> %49, %62
  %66 = fmul <2 x double> %49, %64
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv112, i64 %index
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !8, !noalias !10
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load172 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !8, !noalias !10
  %71 = fadd <2 x double> %wide.load, %65
  %72 = fadd <2 x double> %wide.load172, %66
  store <2 x double> %71, <2 x double>* %68, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %72, <2 x double>* %70, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %73 = icmp eq i64 %index.next, %n.vec
  br i1 %73, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc93.us.us, label %for.inc90.us.us.preheader

for.inc93.us.us.loopexit:                         ; preds = %for.inc90.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.inc90.us.us.prol.loopexit.unr-lcssa, %middle.block
  %indvars.iv.next113 = add nuw i64 %indvars.iv112, 1
  %cmp70.us.us = icmp slt i64 %indvars.iv.next113, %6
  br i1 %cmp70.us.us, label %for.cond73.preheader.us.us, label %for.inc96.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.inc90.us.us.preheader.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr.ph, %for.inc90.us.us.preheader.new ], [ %indvars.iv.next109.1, %for.inc90.us.us ]
  %74 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv108, i64 %indvars.iv114
  %75 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %74, %75
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv112, i64 %indvars.iv108
  %76 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %76, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %77 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next109, i64 %indvars.iv114
  %78 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %77, %78
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next109
  %79 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %79, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next109, %1
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.inc90.us.us, !llvm.loop !14

for.cond99.preheader.for.cond103.preheader.us_crit_edge: ; preds = %for.inc96.us
  %80 = and i64 %34, 8589934588
  %81 = add nsw i64 %80, -4
  %82 = lshr exact i64 %81, 2
  %83 = icmp ult i64 %34, 4
  %84 = bitcast i8* %call to [2000 x [2000 x double]]*
  %85 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp.zero180 = icmp eq i64 %80, 0
  %86 = and i64 %82, 1
  %lcmp.mod = icmp eq i64 %86, 0
  %87 = bitcast i8* %call to [2000 x [2000 x double]]*
  %88 = icmp eq i64 %82, 0
  %cmp.n197 = icmp eq i64 %34, %80
  %89 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond99.preheader.for.cond103.preheader.us_crit_edge
  %indvars.iv106 = phi i64 [ 0, %for.cond99.preheader.for.cond103.preheader.us_crit_edge ], [ %indvars.iv.next107, %for.inc118.us ]
  %scevgep182 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 0
  %scevgep184 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %34
  %90 = mul i64 %indvars.iv106, 16000
  %scevgep186 = getelementptr i8, i8* %call, i64 %90
  %91 = add i64 %22, %90
  %scevgep187 = getelementptr i8, i8* %call, i64 %91
  br i1 %83, label %for.inc115.us.preheader, label %min.iters.checked177

min.iters.checked177:                             ; preds = %for.cond103.preheader.us
  br i1 %cmp.zero180, label %for.inc115.us.preheader, label %vector.memcheck192

vector.memcheck192:                               ; preds = %min.iters.checked177
  %92 = bitcast double* %scevgep184 to i8*
  %93 = bitcast double* %scevgep182 to i8*
  %bound0188 = icmp ult i8* %93, %scevgep187
  %bound1189 = icmp ult i8* %scevgep186, %92
  %memcheck.conflict191 = and i1 %bound0188, %bound1189
  br i1 %memcheck.conflict191, label %for.inc115.us.preheader, label %vector.body173.preheader

vector.body173.preheader:                         ; preds = %vector.memcheck192
  br i1 %lcmp.mod, label %vector.body173.prol.preheader, label %vector.body173.prol.loopexit.unr-lcssa

vector.body173.prol.preheader:                    ; preds = %vector.body173.preheader
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv106, i64 0
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load202.prol = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !15
  %96 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv106, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load203.prol = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !15
  %98 = bitcast double* %scevgep182 to <2 x i64>*
  store <2 x i64> %wide.load202.prol, <2 x i64>* %98, align 8, !alias.scope !18, !noalias !15
  %99 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load203.prol, <2 x i64>* %100, align 8, !alias.scope !18, !noalias !15
  br label %vector.body173.prol.loopexit.unr-lcssa

vector.body173.prol.loopexit.unr-lcssa:           ; preds = %vector.body173.preheader, %vector.body173.prol.preheader
  %index194.unr.ph = phi i64 [ 4, %vector.body173.prol.preheader ], [ 0, %vector.body173.preheader ]
  br i1 %88, label %middle.block174, label %vector.body173.preheader.new

vector.body173.preheader.new:                     ; preds = %vector.body173.prol.loopexit.unr-lcssa
  br label %vector.body173

vector.body173:                                   ; preds = %vector.body173, %vector.body173.preheader.new
  %index194 = phi i64 [ %index194.unr.ph, %vector.body173.preheader.new ], [ %index.next195.1, %vector.body173 ]
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv106, i64 %index194
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load202 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !15
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load203 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !15
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %index194
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load202, <2 x i64>* %106, align 8, !alias.scope !18, !noalias !15
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load203, <2 x i64>* %108, align 8, !alias.scope !18, !noalias !15
  %index.next195 = add i64 %index194, 4
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv106, i64 %index.next195
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load202.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !15
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load203.1 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !15
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %index.next195
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load202.1, <2 x i64>* %114, align 8, !alias.scope !18, !noalias !15
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load203.1, <2 x i64>* %116, align 8, !alias.scope !18, !noalias !15
  %index.next195.1 = add i64 %index194, 8
  %117 = icmp eq i64 %index.next195.1, %80
  br i1 %117, label %middle.block174.loopexit, label %vector.body173, !llvm.loop !20

middle.block174.loopexit:                         ; preds = %vector.body173
  br label %middle.block174

middle.block174:                                  ; preds = %middle.block174.loopexit, %vector.body173.prol.loopexit.unr-lcssa
  br i1 %cmp.n197, label %for.inc118.us, label %for.inc115.us.preheader

for.inc115.us.preheader:                          ; preds = %middle.block174, %vector.memcheck192, %min.iters.checked177, %for.cond103.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck192 ], [ 0, %min.iters.checked177 ], [ 0, %for.cond103.preheader.us ], [ %80, %middle.block174 ]
  %118 = sub nsw i64 %34, %indvars.iv.ph
  %119 = sub nsw i64 %1, %indvars.iv.ph
  %xtraiter204 = and i64 %118, 3
  %lcmp.mod205 = icmp eq i64 %xtraiter204, 0
  br i1 %lcmp.mod205, label %for.inc115.us.prol.loopexit, label %for.inc115.us.prol.preheader

for.inc115.us.prol.preheader:                     ; preds = %for.inc115.us.preheader
  br label %for.inc115.us.prol

for.inc115.us.prol:                               ; preds = %for.inc115.us.prol, %for.inc115.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc115.us.prol ], [ %indvars.iv.ph, %for.inc115.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc115.us.prol ], [ %xtraiter204, %for.inc115.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv106, i64 %indvars.iv.prol
  %120 = bitcast double* %arrayidx110.us.prol to i64*
  %121 = load i64, i64* %120, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv.prol
  %122 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %121, i64* %122, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc115.us.prol.loopexit.loopexit, label %for.inc115.us.prol, !llvm.loop !21

for.inc115.us.prol.loopexit.loopexit:             ; preds = %for.inc115.us.prol
  br label %for.inc115.us.prol.loopexit

for.inc115.us.prol.loopexit:                      ; preds = %for.inc115.us.prol.loopexit.loopexit, %for.inc115.us.preheader
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc115.us.preheader ], [ %indvars.iv.next.prol, %for.inc115.us.prol.loopexit.loopexit ]
  %123 = icmp ult i64 %119, 3
  br i1 %123, label %for.inc118.us, label %for.inc115.us.preheader.new

for.inc115.us.preheader.new:                      ; preds = %for.inc115.us.prol.loopexit
  br label %for.inc115.us

for.inc115.us:                                    ; preds = %for.inc115.us, %for.inc115.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc115.us.preheader.new ], [ %indvars.iv.next.3, %for.inc115.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv106, i64 %indvars.iv
  %124 = bitcast double* %arrayidx110.us to i64*
  %125 = load i64, i64* %124, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv
  %126 = bitcast double* %arrayidx114.us to i64*
  store i64 %125, i64* %126, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next
  %127 = bitcast double* %arrayidx110.us.1 to i64*
  %128 = load i64, i64* %127, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv.next
  %129 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %128, i64* %129, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %130 = bitcast double* %arrayidx110.us.2 to i64*
  %131 = load i64, i64* %130, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv.next.1
  %132 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %131, i64* %132, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %133 = bitcast double* %arrayidx110.us.3 to i64*
  %134 = load i64, i64* %133, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv106, i64 %indvars.iv.next.2
  %135 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %134, i64* %135, align 8
  %exitcond158.3 = icmp eq i64 %indvars.iv.next.2, %1
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond158.3, label %for.inc118.us.loopexit, label %for.inc115.us, !llvm.loop !22

for.inc118.us.loopexit:                           ; preds = %for.inc115.us
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit, %for.inc115.us.prol.loopexit, %middle.block174
  %indvars.iv.next107 = add nuw i64 %indvars.iv106, 1
  %cmp100.us = icmp slt i64 %indvars.iv.next107, %6
  br i1 %cmp100.us, label %for.cond103.preheader.us, label %for.end120.loopexit

for.end120.loopexit:                              ; preds = %for.inc118.us
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.end46.thread
  %call149152156 = phi i8* [ %call147, %for.end46.thread ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call149152156) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp102 = icmp sgt i32 %n, 0
  br i1 %cmp102, label %entry.for.cond1.preheader_crit_edge, label %for.end113

entry.for.cond1.preheader_crit_edge:              ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry.for.cond1.preheader_crit_edge
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %for.inc58 ], [ 4294967295, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %for.inc58 ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %1 = and i64 %indvars.iv145, 4294967295
  %cmp294 = icmp sgt i64 %indvars.iv134, 0
  br i1 %cmp294, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv134, i64 0
  br label %for.body3

for.cond61.preheader.for.body63_crit_edge:        ; preds = %for.inc58
  br label %for.body63

for.body30.us.preheader:                          ; preds = %for.inc25
  %2 = and i64 %indvars.iv145, 1
  %lcmp.mod158 = icmp eq i64 %2, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv134, i64 0
  %3 = icmp eq i64 %1, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.inc55.us ], [ %indvars.iv134, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv134, i64 %indvars.iv132
  %4 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod158, label %for.inc48.us.prol.preheader, label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  %5 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv132
  %6 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %5, %6
  %sub47.us.prol = fsub double %4, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol.preheader
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol.preheader ], [ undef, %for.body30.us ]
  %indvars.iv124.unr.ph = phi i64 [ 1, %for.inc48.us.prol.preheader ], [ 0, %for.body30.us ]
  %w.198.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol.preheader ], [ %4, %for.body30.us ]
  br i1 %3, label %for.inc55.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv124 = phi i64 [ %indvars.iv124.unr.ph, %for.body30.us.new ], [ %indvars.iv.next125.1, %for.inc48.us ]
  %w.198.us = phi double [ %w.198.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv134, i64 %indvars.iv124
  %7 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv132
  %8 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %9 = load <2 x double>, <2 x double>* %7, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next125, i64 %indvars.iv132
  %10 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %8, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %10, i32 1
  %mul46.us = fmul <2 x double> %9, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.198.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond147.1 = icmp eq i64 %indvars.iv.next125, %1
  %indvars.iv.next125.1 = add nsw i64 %indvars.iv124, 2
  br i1 %exitcond147.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit.unr-lcssa
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit.unr-lcssa ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next133 = add nuw i64 %indvars.iv132, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next133, %0
  br i1 %cmp29.us, label %for.body30.us, label %for.inc58.loopexit

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %for.inc25 ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %for.inc25 ], [ 0, %for.body3.preheader ]
  %11 = and i64 %indvars.iv142, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv134, i64 %indvars.iv121
  %12 = load double, double* %arrayidx5, align 8
  %cmp790 = icmp sgt i64 %indvars.iv121, 0
  br i1 %cmp790, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %13 = and i64 %indvars.iv142, 1
  %lcmp.mod156 = icmp eq i64 %13, 0
  br i1 %lcmp.mod156, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  %14 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv121
  %15 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %14, %15
  %sub.prol = fsub double %12, %mul.prol
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ undef, %for.inc.preheader ]
  %indvars.iv115.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.preheader ]
  %w.092.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %12, %for.inc.preheader ]
  %16 = icmp eq i64 %11, 0
  br i1 %16, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv115 = phi i64 [ %indvars.iv115.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next116.1, %for.inc ]
  %w.092 = phi double [ %w.092.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv134, i64 %indvars.iv115
  %17 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv121
  %18 = load double, double* %arrayidx16, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %19 = load <2 x double>, <2 x double>* %17, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next116, i64 %indvars.iv121
  %20 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %18, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %20, i32 1
  %mul = fmul <2 x double> %19, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.092, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond144.1 = icmp eq i64 %indvars.iv.next116, %11
  %indvars.iv.next116.1 = add nsw i64 %indvars.iv115, 2
  br i1 %exitcond144.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.body3
  %w.0.lcssa = phi double [ %12, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.unr-lcssa ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv121
  %21 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %21
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next122 = add nuw i64 %indvars.iv121, 1
  %cmp2 = icmp slt i64 %indvars.iv.next122, %indvars.iv134
  %indvars.iv.next143 = add nuw nsw i64 %11, 1
  br i1 %cmp2, label %for.body3, label %for.body30.us.preheader

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader
  %indvars.iv.next135 = add nuw i64 %indvars.iv134, 1
  %cmp = icmp slt i64 %indvars.iv.next135, %0
  %indvars.iv.next146 = add nuw nsw i64 %1, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond61.preheader.for.body63_crit_edge

for.cond86.preheader.for.body88_crit_edge:        ; preds = %for.inc82
  %22 = add i32 %n, -1
  %wide.trip.count = sext i32 %22 to i64
  %23 = add nsw i64 %wide.trip.count, 1
  %24 = sub nsw i64 %23, %0
  %25 = sub nsw i64 %wide.trip.count, %0
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body63:                                       ; preds = %for.inc82, %for.cond61.preheader.for.body63_crit_edge
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %for.inc82 ], [ 4294967295, %for.cond61.preheader.for.body63_crit_edge ]
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %for.inc82 ], [ 0, %for.cond61.preheader.for.body63_crit_edge ]
  %26 = and i64 %indvars.iv139, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv113
  %27 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv113, 0
  br i1 %cmp6784, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %28 = add nsw i64 %indvars.iv139, 1
  %xtraiter152 = and i64 %28, 3
  %lcmp.mod153 = icmp eq i64 %xtraiter152, 0
  br i1 %lcmp.mod153, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.286.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %27, %for.inc77.prol.preheader ]
  %prol.iter154 = phi i64 [ %prol.iter154.sub, %for.inc77.prol ], [ %xtraiter152, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.prol
  %29 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %30 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %29, %30
  %sub76.prol = fsub double %w.286.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter154.sub = add i64 %prol.iter154, -1
  %prol.iter154.cmp = icmp eq i64 %prol.iter154.sub, 0
  br i1 %prol.iter154.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !23

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.286.unr = phi double [ %27, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %31 = icmp ult i64 %26, 3
  br i1 %31, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc77.preheader.new ], [ %indvars.iv.next.3, %for.inc77 ]
  %w.286 = phi double [ %w.286.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv
  %32 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %33 = bitcast double* %arrayidx74 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %32, align 8
  %35 = load <2 x double>, <2 x double>* %33, align 8
  %mul75 = fmul <2 x double> %34, %35
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.286, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv.next.1
  %36 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %37 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %39 = load <2 x double>, <2 x double>* %37, align 8
  %mul75.2 = fmul <2 x double> %38, %39
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond141.3 = icmp eq i64 %indvars.iv.next.2, %26
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond141.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %27, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv113
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next114 = add nuw i64 %indvars.iv113, 1
  %cmp62 = icmp slt i64 %indvars.iv.next114, %0
  %indvars.iv.next140 = add nuw nsw i64 %26, 1
  br i1 %cmp62, label %for.body63, label %for.cond86.preheader.for.body88_crit_edge

for.body88:                                       ; preds = %for.inc112, %for.cond86.preheader.for.body88_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.inc112 ], [ 0, %for.cond86.preheader.for.body88_crit_edge ]
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.inc112 ], [ %0, %for.cond86.preheader.for.body88_crit_edge ]
  %40 = add i64 %25, %indvar
  %indvars.iv.next108 = add i64 %indvars.iv107, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next108
  %41 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv107, %0
  br i1 %cmp9278, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %42 = add i64 %24, %indvar
  %xtraiter = and i64 %42, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv105.prol = phi i64 [ %indvars.iv.next106.prol, %for.inc102.prol ], [ %indvars.iv107, %for.inc102.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %41, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv105.prol
  %43 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv105.prol
  %44 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %43, %44
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next106.prol = add i64 %indvars.iv105.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !24

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv105.unr = phi i64 [ %indvars.iv107, %for.inc102.preheader ], [ %indvars.iv.next106.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %41, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %45 = icmp ult i64 %40, 3
  br i1 %45, label %for.inc112, label %for.inc102.preheader.new

for.inc102.preheader.new:                         ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.preheader.new
  %indvars.iv105 = phi i64 [ %indvars.iv105.unr, %for.inc102.preheader.new ], [ %indvars.iv.next106.3, %for.inc102 ]
  %w.379 = phi double [ %w.379.unr, %for.inc102.preheader.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv105
  %46 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv105
  %47 = bitcast double* %arrayidx99 to <2 x double>*
  %48 = load <2 x double>, <2 x double>* %46, align 8
  %49 = load <2 x double>, <2 x double>* %47, align 8
  %mul100 = fmul <2 x double> %48, %49
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next106.1 = add i64 %indvars.iv105, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv.next106.1
  %50 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next106.1
  %51 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next106.2 = add i64 %indvars.iv105, 3
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %53 = load <2 x double>, <2 x double>* %51, align 8
  %mul100.2 = fmul <2 x double> %52, %53
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next106.2, %wide.trip.count
  %indvars.iv.next106.3 = add i64 %indvars.iv105, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %41, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next108, i64 %indvars.iv.next108
  %54 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %54
  %sunkaddr148 = shl i64 %indvars.iv107, 3
  %sunkaddr149 = add i64 %sunkaddr, %sunkaddr148
  %sunkaddr150 = add i64 %sunkaddr149, -8
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to double*
  store double %div109, double* %sunkaddr151, align 8
  %cmp87 = icmp sgt i64 %indvars.iv107, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.inc112
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
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %entry.for.body_crit_edge, label %for.end

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
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

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

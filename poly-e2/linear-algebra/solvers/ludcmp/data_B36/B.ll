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
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(double* %arraydecay5)
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
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv103 = phi i64 [ 0, %entry ], [ %indvars.iv.next104.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv103
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv103
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %2 = trunc i64 %indvars.iv103 to i32
  %3 = or i32 %2, 1
  %conv4 = sitofp i32 %3 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv103
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next104.1 = add nuw nsw i64 %indvars.iv103, 2
  %4 = trunc i64 %indvars.iv.next104.1 to i32
  %conv4.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %5 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %5, align 8
  %exitcond106.1 = icmp eq i64 %indvars.iv.next104.1, 2000
  br i1 %exitcond106.1, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.end39.for.body16.lr.ph_crit_edge
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.end39.for.body16.lr.ph_crit_edge ], [ 0, %for.body16.lr.ph.preheader ]
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %for.end39.for.body16.lr.ph_crit_edge ], [ 1, %for.body16.lr.ph.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv99, 2001
  %7 = add nuw nsw i64 %6, 1
  %scevgep95 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %7
  %8 = sub i64 1998, %indvars.iv99
  %9 = shl i64 %8, 3
  %10 = and i64 %9, 34359738360
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %cmp3029 = icmp slt i64 %indvars.iv.next100, 2000
  br i1 %cmp3029, label %for.body32.preheader, label %for.end39

for.body32.preheader:                             ; preds = %for.cond29.preheader
  %11 = add nuw nsw i64 %10, 8
  %scevgep9596 = bitcast double* %scevgep95 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9596, i8 0, i64 %11, i32 8, i1 false)
  br label %for.end39

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv82 = phi i64 [ 0, %for.body16.lr.ph ], [ %indvars.iv.next83, %for.body16 ]
  %12 = sub nsw i64 0, %indvars.iv82
  %13 = trunc i64 %12 to i32
  %rem = srem i32 %13, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv82
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next83, %indvars.iv97
  br i1 %exitcond88, label %for.cond29.preheader, label %for.body16

for.end39:                                        ; preds = %for.cond29.preheader, %for.body32.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv99
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond = icmp eq i64 %indvars.iv.next100, 2000
  br i1 %exitcond, label %for.end46, label %for.end39.for.body16.lr.ph_crit_edge

for.end39.for.body16.lr.ph_crit_edge:             ; preds = %for.end39
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  br label %for.body16.lr.ph

for.end46:                                        ; preds = %for.end39
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.body54.lr.ph.us

for.body54.lr.ph.us:                              ; preds = %for.body54.lr.ph.us, %for.end46
  %indvars.iv78 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next79.3.1, %for.body54.lr.ph.us ]
  %14 = mul nuw nsw i64 %indvars.iv78, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %15 = add nuw nsw i64 %14, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %16 = add nuw nsw i64 %14, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %17 = add nuw nsw i64 %14, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.3 = or i64 %indvars.iv78, 4
  %18 = mul nuw nsw i64 %indvars.iv.next79.3, 16000
  %scevgep.11 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.11, i8 0, i64 16000, i32 8, i1 false)
  %19 = add nuw nsw i64 %18, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %20 = add nuw nsw i64 %18, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %21 = add nuw nsw i64 %18, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next79.3.1 = add nsw i64 %indvars.iv78, 8
  %exitcond81.3.1 = icmp eq i64 %indvars.iv.next79.3.1, 2000
  br i1 %exitcond81.3.1, label %for.cond73.preheader.lr.ph.us.preheader, label %for.body54.lr.ph.us

for.cond73.preheader.lr.ph.us.preheader:          ; preds = %for.body54.lr.ph.us
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body76.lr.ph.us.us.preheader

for.body76.lr.ph.us.us.preheader:                 ; preds = %for.end95.us, %for.cond73.preheader.lr.ph.us.preheader
  %indvars.iv70 = phi i64 [ 0, %for.cond73.preheader.lr.ph.us.preheader ], [ %indvars.iv.next71, %for.end95.us ]
  br label %for.body76.lr.ph.us.us

for.end95.us:                                     ; preds = %for.body76.us.us.for.end92.us.us_crit_edge
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 2000
  br i1 %exitcond73, label %for.body106.lr.ph.us.preheader, label %for.body76.lr.ph.us.us.preheader

for.body106.lr.ph.us.preheader:                   ; preds = %for.end95.us
  br label %for.body106.lr.ph.us

for.body76.lr.ph.us.us:                           ; preds = %for.body76.us.us.for.end92.us.us_crit_edge, %for.body76.lr.ph.us.us.preheader
  %indvars.iv66 = phi i64 [ 0, %for.body76.lr.ph.us.us.preheader ], [ %indvars.iv.next67, %for.body76.us.us.for.end92.us.us_crit_edge ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv70
  br label %for.body76.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us, %for.body76.lr.ph.us.us
  %indvars.iv62 = phi i64 [ 0, %for.body76.lr.ph.us.us ], [ %indvars.iv.next63.1, %for.body76.us.us ]
  %23 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv70
  %24 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %23, %24
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv66, i64 %indvars.iv62
  %25 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %25, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next63 = or i64 %indvars.iv62, 1
  %26 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next63, i64 %indvars.iv70
  %27 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %26, %27
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv66, i64 %indvars.iv.next63
  %28 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %28, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63.1, 2000
  br i1 %exitcond65.1, label %for.body76.us.us.for.end92.us.us_crit_edge, label %for.body76.us.us

for.body76.us.us.for.end92.us.us_crit_edge:       ; preds = %for.body76.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, 2000
  br i1 %exitcond69, label %for.end95.us, label %for.body76.lr.ph.us.us

for.body106.lr.ph.us:                             ; preds = %for.body106.lr.ph.us.preheader, %for.end117.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.end117.us ], [ 0, %for.body106.lr.ph.us.preheader ]
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us, %for.body106.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body106.lr.ph.us ], [ %indvars.iv.next.3, %for.body106.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv57, i64 %indvars.iv
  %29 = bitcast double* %arrayidx110.us to i64*
  %30 = load i64, i64* %29, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv
  %31 = bitcast double* %arrayidx114.us to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv57, i64 %indvars.iv.next
  %32 = bitcast double* %arrayidx110.us.1 to i64*
  %33 = load i64, i64* %32, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next
  %34 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %35 = bitcast double* %arrayidx110.us.2 to i64*
  %36 = load i64, i64* %35, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %37 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv57, i64 %indvars.iv.next.2
  %38 = bitcast double* %arrayidx110.us.3 to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next.2
  %40 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.end117.us, label %for.body106.us

for.end117.us:                                    ; preds = %for.body106.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 2000
  br i1 %exitcond60, label %for.end120, label %for.body106.lr.ph.us

for.end120:                                       ; preds = %for.end117.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end57, %entry
  %indvars.iv77 = phi i64 [ 0, %entry ], [ %indvars.iv.next78, %for.end57 ]
  %cmp229 = icmp sgt i64 %indvars.iv77, 0
  br i1 %cmp229, label %for.body3.preheader, label %for.end57

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 0
  br label %for.body3

for.body37.lr.ph.us.preheader:                    ; preds = %for.end
  %xtraiter88 = and i64 %indvars.iv77, 1
  %lcmp.mod89 = icmp eq i64 %xtraiter88, 0
  %0 = icmp eq i64 %indvars.iv77, 1
  br label %for.body37.lr.ph.us

for.body37.lr.ph.us:                              ; preds = %for.end50.us, %for.body37.lr.ph.us.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv77, %for.body37.lr.ph.us.preheader ], [ %indvars.iv.next74, %for.end50.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv73
  %1 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod89, label %for.body37.us.prol.loopexit.unr-lcssa, label %for.body37.us.prol.preheader

for.body37.us.prol.preheader:                     ; preds = %for.body37.lr.ph.us
  %2 = load double, double* %arrayidx12.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv73
  %3 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %1, %mul46.us.prol
  br label %for.body37.us.prol.loopexit.unr-lcssa

for.body37.us.prol.loopexit.unr-lcssa:            ; preds = %for.body37.lr.ph.us, %for.body37.us.prol.preheader
  %indvars.iv66.unr.ph = phi i64 [ 1, %for.body37.us.prol.preheader ], [ 0, %for.body37.lr.ph.us ]
  %.unr90.ph = phi double [ %sub47.us.prol, %for.body37.us.prol.preheader ], [ %1, %for.body37.lr.ph.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol.preheader ], [ undef, %for.body37.lr.ph.us ]
  br i1 %0, label %for.end50.us, label %for.body37.us.preheader

for.body37.us.preheader:                          ; preds = %for.body37.us.prol.loopexit.unr-lcssa
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.preheader, %for.body37.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %for.body37.us ], [ %indvars.iv66.unr.ph, %for.body37.us.preheader ]
  %4 = phi double [ %sub47.us.1, %for.body37.us ], [ %.unr90.ph, %for.body37.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv66
  %5 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv66, i64 %indvars.iv73
  %6 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %7 = load <2 x double>, <2 x double>* %5, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next67, i64 %indvars.iv73
  %8 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %6, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %8, i32 1
  %mul46.us = fmul <2 x double> %7, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %4, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %indvars.iv.next67.1 = add nuw nsw i64 %indvars.iv66, 2
  %exitcond70.1 = icmp eq i64 %indvars.iv.next67.1, %indvars.iv77
  br i1 %exitcond70.1, label %for.end50.us.loopexit, label %for.body37.us

for.end50.us.loopexit:                            ; preds = %for.body37.us
  br label %for.end50.us

for.end50.us:                                     ; preds = %for.end50.us.loopexit, %for.body37.us.prol.loopexit.unr-lcssa
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit.unr-lcssa ], [ %sub47.us.1, %for.end50.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next74, 2000
  br i1 %exitcond98, label %for.end57.loopexit, label %for.body37.lr.ph.us

for.body3:                                        ; preds = %for.end, %for.body3.preheader
  %indvars.iv59 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next60, %for.end ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv59
  %9 = load double, double* %arrayidx5, align 8
  %cmp726 = icmp sgt i64 %indvars.iv59, 0
  br i1 %cmp726, label %for.body8.lr.ph, label %for.end

for.body8.lr.ph:                                  ; preds = %for.body3
  %xtraiter85 = and i64 %indvars.iv59, 1
  %lcmp.mod86 = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod86, label %for.body8.prol.loopexit.unr-lcssa, label %for.body8.prol.preheader

for.body8.prol.preheader:                         ; preds = %for.body8.lr.ph
  %10 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv59
  %11 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %10, %11
  %sub.prol = fsub double %9, %mul.prol
  br label %for.body8.prol.loopexit.unr-lcssa

for.body8.prol.loopexit.unr-lcssa:                ; preds = %for.body8.lr.ph, %for.body8.prol.preheader
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.body8.prol.preheader ], [ 0, %for.body8.lr.ph ]
  %.unr87.ph = phi double [ %sub.prol, %for.body8.prol.preheader ], [ %9, %for.body8.lr.ph ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol.preheader ], [ undef, %for.body8.lr.ph ]
  %12 = icmp eq i64 %indvars.iv59, 1
  br i1 %12, label %for.end, label %for.body8.preheader

for.body8.preheader:                              ; preds = %for.body8.prol.loopexit.unr-lcssa
  br label %for.body8

for.body8:                                        ; preds = %for.body8.preheader, %for.body8
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %for.body8 ], [ %indvars.iv54.unr.ph, %for.body8.preheader ]
  %13 = phi double [ %sub.1, %for.body8 ], [ %.unr87.ph, %for.body8.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv54
  %14 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv59
  %15 = load double, double* %arrayidx16, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %16 = load <2 x double>, <2 x double>* %14, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv59
  %17 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %15, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %17, i32 1
  %mul = fmul <2 x double> %16, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %13, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, %indvars.iv59
  br i1 %exitcond58.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit.unr-lcssa, %for.body3
  %.lcssa13 = phi double [ %9, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit.unr-lcssa ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv59
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %.lcssa13, %18
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next60, %indvars.iv77
  br i1 %exitcond64, label %for.body37.lr.ph.us.preheader, label %for.body3

for.end57.loopexit:                               ; preds = %for.end50.us
  br label %for.end57

for.end57:                                        ; preds = %for.end57.loopexit, %for.cond1.preheader
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next78, 2000
  br i1 %exitcond99, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.end57
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.end79.for.body63_crit_edge
  %indvars.iv96 = phi i2 [ %indvars.iv.next97, %for.end79.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.end79.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %19 = zext i2 %indvars.iv96 to i64
  %20 = add nsw i64 %indvars.iv50, -1
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv50
  %21 = bitcast double* %arrayidx65 to i64*
  %22 = load i64, i64* %21, align 8
  %cmp6721 = icmp sgt i64 %indvars.iv50, 0
  br i1 %cmp6721, label %for.body68.lr.ph, label %for.end79

for.body68.lr.ph:                                 ; preds = %for.body63
  %23 = bitcast i64 %22 to double
  %xtraiter81 = and i64 %indvars.iv50, 3
  %lcmp.mod82 = icmp eq i64 %xtraiter81, 0
  br i1 %lcmp.mod82, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.lr.ph
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol.preheader, %for.body68.prol.for.body68.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body68.prol.for.body68.prol_crit_edge ], [ 0, %for.body68.prol.preheader ]
  %24 = phi double [ %sub76.prol, %for.body68.prol.for.body68.prol_crit_edge ], [ %23, %for.body68.prol.preheader ]
  %prol.iter83 = phi i64 [ %prol.iter83.sub, %for.body68.prol.for.body68.prol_crit_edge ], [ %xtraiter81, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv.prol
  %25 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %26 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %25, %26
  %sub76.prol = fsub double %24, %mul75.prol
  %prol.iter83.sub = add nsw i64 %prol.iter83, -1
  %prol.iter83.cmp = icmp eq i64 %prol.iter83.sub, 0
  br i1 %prol.iter83.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol.for.body68.prol_crit_edge, !llvm.loop !1

for.body68.prol.for.body68.prol_crit_edge:        ; preds = %for.body68.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.body68.prol

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body68.lr.ph ], [ %19, %for.body68.prol.loopexit.loopexit ]
  %.unr84 = phi double [ %23, %for.body68.lr.ph ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.body68.lr.ph ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %27 = icmp ult i64 %20, 3
  br i1 %27, label %for.end79.loopexit, label %for.body68.preheader

for.body68.preheader:                             ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68.preheader, %for.body68
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body68 ], [ %indvars.iv.unr, %for.body68.preheader ]
  %28 = phi double [ %sub76.3, %for.body68 ], [ %.unr84, %for.body68.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv
  %29 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %30 = bitcast double* %arrayidx74 to <2 x double>*
  %31 = load <2 x double>, <2 x double>* %29, align 8
  %32 = load <2 x double>, <2 x double>* %30, align 8
  %mul75 = fmul <2 x double> %31, %32
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %28, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %34 = bitcast double* %arrayidx74.2 to <2 x double>*
  %35 = load <2 x double>, <2 x double>* %33, align 8
  %36 = load <2 x double>, <2 x double>* %34, align 8
  %mul75.2 = fmul <2 x double> %35, %36
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond49.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv50
  br i1 %exitcond49.3, label %for.end79.loopexit.loopexit, label %for.body68

for.end79.loopexit.loopexit:                      ; preds = %for.body68
  br label %for.end79.loopexit

for.end79.loopexit:                               ; preds = %for.end79.loopexit.loopexit, %for.body68.prol.loopexit
  %sub76.lcssa = phi double [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit.loopexit ]
  %37 = bitcast double %sub76.lcssa to i64
  br label %for.end79

for.end79:                                        ; preds = %for.body63, %for.end79.loopexit
  %.lcssa12 = phi i64 [ %37, %for.end79.loopexit ], [ %22, %for.body63 ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv50
  %38 = bitcast double* %arrayidx81 to i64*
  store i64 %.lcssa12, i64* %38, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond, label %for.body88.preheader, label %for.end79.for.body63_crit_edge

for.body88.preheader:                             ; preds = %for.end79
  br label %for.body88

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  %indvars.iv.next97 = add i2 %indvars.iv96, 1
  br label %for.body63

for.body88:                                       ; preds = %for.body88.preheader, %for.end104.for.body88_crit_edge
  %indvars.iv94 = phi i2 [ %indvars.iv.next95, %for.end104.for.body88_crit_edge ], [ 0, %for.body88.preheader ]
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.end104.for.body88_crit_edge ], [ 2001, %for.body88.preheader ]
  %indvar = phi i32 [ %indvar.next, %for.end104.for.body88_crit_edge ], [ 0, %for.body88.preheader ]
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.end104.for.body88_crit_edge ], [ 2000, %for.body88.preheader ]
  %39 = zext i2 %indvars.iv94 to i64
  %40 = add nuw nsw i64 %39, 4294967295
  %41 = and i64 %40, 4294967295
  %42 = add i64 %indvars.iv92, %41
  %43 = add nsw i32 %indvar, -1
  %indvars.iv.next46 = add nsw i64 %indvars.iv45, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next46
  %44 = load double, double* %arrayidx90, align 8
  %cmp9216 = icmp slt i64 %indvars.iv45, 2000
  br i1 %cmp9216, label %for.body93.preheader, label %for.end104

for.body93.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.preheader
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol.preheader, %for.body93.prol.for.body93.prol_crit_edge
  %indvars.iv43.prol = phi i64 [ %indvars.iv.next44.prol, %for.body93.prol.for.body93.prol_crit_edge ], [ %indvars.iv45, %for.body93.prol.preheader ]
  %45 = phi double [ %sub101.prol, %for.body93.prol.for.body93.prol_crit_edge ], [ %44, %for.body93.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body93.prol.for.body93.prol_crit_edge ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next46, i64 %indvars.iv43.prol
  %46 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv43.prol
  %47 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %46, %47
  %sub101.prol = fsub double %45, %mul100.prol
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol.for.body93.prol_crit_edge, !llvm.loop !3

for.body93.prol.for.body93.prol_crit_edge:        ; preds = %for.body93.prol
  %indvars.iv.next44.prol = add nsw i64 %indvars.iv43.prol, 1
  br label %for.body93.prol

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.preheader
  %indvars.iv43.unr = phi i64 [ %indvars.iv45, %for.body93.preheader ], [ %42, %for.body93.prol.loopexit.loopexit ]
  %.unr = phi double [ %44, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %48 = icmp ult i32 %43, 3
  br i1 %48, label %for.end104, label %for.body93.preheader1

for.body93.preheader1:                            ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93.preheader1, %for.body93
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.3, %for.body93 ], [ %indvars.iv43.unr, %for.body93.preheader1 ]
  %49 = phi double [ %sub101.3, %for.body93 ], [ %.unr, %for.body93.preheader1 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next46, i64 %indvars.iv43
  %50 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv43
  %51 = bitcast double* %arrayidx99 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %50, align 8
  %53 = load <2 x double>, <2 x double>* %51, align 8
  %mul100 = fmul <2 x double> %52, %53
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %49, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next46, i64 %indvars.iv.next44.1
  %54 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next44.1
  %55 = bitcast double* %arrayidx99.2 to <2 x double>*
  %56 = load <2 x double>, <2 x double>* %54, align 8
  %57 = load <2 x double>, <2 x double>* %55, align 8
  %mul100.2 = fmul <2 x double> %56, %57
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %indvars.iv.next44.3 = add nsw i64 %indvars.iv43, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next44.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, 2000
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %.lcssa = phi double [ %44, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next46, i64 %indvars.iv.next46
  %58 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %.lcssa, %58
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next46
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv45, 1
  br i1 %cmp87, label %for.end104.for.body88_crit_edge, label %for.end113

for.end104.for.body88_crit_edge:                  ; preds = %for.end104
  %indvars.iv.next95 = add i2 %indvars.iv94, 1
  %indvars.iv.next93 = add nsw i64 %indvars.iv92, -1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %for.body88

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond3, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
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
!3 = distinct !{!3, !2}

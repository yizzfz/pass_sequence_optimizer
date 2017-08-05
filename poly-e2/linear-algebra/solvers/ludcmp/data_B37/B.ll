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
  %arraydecay1 = bitcast i8* %call to [2000 x double]*
  %arraydecay42 = bitcast i8* %call1 to double*
  %arraydecay53 = bitcast i8* %call2 to double*
  %arraydecay64 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay1, double* %arraydecay42, double* %arraydecay53, double* %arraydecay64)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay1, double* %arraydecay42, double* %arraydecay53, double* %arraydecay64)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay53)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  br label %for.inc

for.inc:                                          ; preds = %entry, %for.inc
  %indvars.iv131 = phi i64 [ %indvars.iv.next132.1, %for.inc ], [ 0, %entry ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv131
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv131
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next132 = or i64 %indvars.iv131, 1
  %0 = trunc i64 %indvars.iv.next132 to i32
  %conv4 = sitofp i32 %0 to double
  %div = fdiv double %conv4, 2.000000e+03
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv131
  store double %add6, double* %arrayidx8, align 8
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next132
  store double 0.000000e+00, double* %arrayidx.1, align 8
  %arrayidx3.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next132
  store double 0.000000e+00, double* %arrayidx3.1, align 8
  %indvars.iv.next132.1 = add nuw nsw i64 %indvars.iv131, 2
  %1 = trunc i64 %indvars.iv.next132.1 to i32
  %conv4.1 = sitofp i32 %1 to double
  %div.1 = fdiv double %conv4.1, 2.000000e+03
  %div5.1 = fmul double %div.1, 5.000000e-01
  %add6.1 = fadd double %div5.1, 4.000000e+00
  %arrayidx8.1 = getelementptr inbounds double, double* %b, i64 %indvars.iv.next132
  store double %add6.1, double* %arrayidx8.1, align 8
  %exitcond134.1 = icmp eq i64 %indvars.iv.next132.1, 2000
  br i1 %exitcond134.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.inc44 ], [ 0, %for.inc25.lr.ph.preheader ]
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %for.inc44 ], [ 1, %for.inc25.lr.ph.preheader ]
  %2 = mul nuw nsw i64 %indvars.iv127, 2001
  %3 = add nuw nsw i64 %2, 1
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %3
  %4 = sub nsw i64 1998, %indvars.iv127
  %5 = shl i64 %4, 3
  %6 = and i64 %5, 34359738360
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %cmp3075 = icmp slt i64 %indvars.iv.next128, 2000
  br i1 %cmp3075, label %for.inc44.loopexit, label %for.inc44

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %7 = sub nsw i64 0, %indvars.iv110
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv127, i64 %indvars.iv110
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next111, %indvars.iv125
  br i1 %exitcond116, label %for.cond29.preheader, label %for.inc25

for.inc44.loopexit:                               ; preds = %for.cond29.preheader
  %9 = add nuw nsw i64 %6, 8
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep123124, i8 0, i64 %9, i32 8, i1 false)
  br label %for.inc44

for.inc44:                                        ; preds = %for.inc44.loopexit, %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv127, i64 %indvars.iv127
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next128, 2000
  br i1 %exitcond130, label %for.end46, label %for.inc25.lr.ph

for.end46:                                        ; preds = %for.inc44
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %10 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc62.3

for.cond69.preheader:                             ; preds = %for.cond69.preheader.preheader, %for.inc96
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %for.inc96 ], [ 0, %for.cond69.preheader.preheader ]
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.inc93, %for.cond69.preheader
  %indvars.iv91 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next92, %for.inc93 ]
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv95
  br label %for.inc90

for.inc90:                                        ; preds = %for.cond73.preheader, %for.inc90
  %indvars.iv85 = phi i64 [ %indvars.iv.next86.1, %for.inc90 ], [ 0, %for.cond73.preheader ]
  %11 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv95
  %12 = load double, double* %arrayidx84, align 8
  %mul = fmul double %11, %12
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv91, i64 %indvars.iv85
  %13 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %13, %mul
  store double %add89, double* %arrayidx88, align 8
  %indvars.iv.next86 = or i64 %indvars.iv85, 1
  %14 = load double, double* %arrayidx80, align 8
  %arrayidx84.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next86, i64 %indvars.iv95
  %15 = load double, double* %arrayidx84.1, align 8
  %mul.1 = fmul double %14, %15
  %arrayidx88.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next86
  %16 = load double, double* %arrayidx88.1, align 8
  %add89.1 = fadd double %16, %mul.1
  store double %add89.1, double* %arrayidx88.1, align 8
  %indvars.iv.next86.1 = add nuw nsw i64 %indvars.iv85, 2
  %exitcond88.1 = icmp eq i64 %indvars.iv.next86.1, 2000
  br i1 %exitcond88.1, label %for.inc93, label %for.inc90

for.inc93:                                        ; preds = %for.inc90
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 2000
  br i1 %exitcond94, label %for.inc96, label %for.cond73.preheader

for.inc96:                                        ; preds = %for.inc93
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, 2000
  br i1 %exitcond98, label %for.cond103.preheader.preheader, label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.inc96
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.cond103.preheader.preheader, %for.inc118
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %for.inc118 ], [ 0, %for.cond103.preheader.preheader ]
  br label %for.inc115

for.inc115:                                       ; preds = %for.cond103.preheader, %for.inc115
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc115 ], [ 0, %for.cond103.preheader ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv82, i64 %indvars.iv
  %17 = bitcast double* %arrayidx110 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv
  %19 = bitcast double* %arrayidx114 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx110.1 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv.next
  %22 = bitcast double* %arrayidx114.1 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx110.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx110.2 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx114.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %25 = bitcast double* %arrayidx114.2 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx110.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %26 = bitcast double* %arrayidx110.3 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx114.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %28 = bitcast double* %arrayidx114.3 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.inc118, label %for.inc115

for.inc118:                                       ; preds = %for.inc115
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond = icmp eq i64 %indvars.iv.next83, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader

for.end120:                                       ; preds = %for.inc118
  tail call void @free(i8* %call) #4
  ret void

for.inc62.3:                                      ; preds = %for.inc62.3, %for.end46
  %indvars.iv103 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next104.3.1, %for.inc62.3 ]
  %29 = mul nuw nsw i64 %indvars.iv103, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul nuw nsw i64 %indvars.iv103, 16000
  %31 = add nuw nsw i64 %30, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul nuw nsw i64 %indvars.iv103, 16000
  %33 = add nuw nsw i64 %32, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %34 = mul nuw nsw i64 %indvars.iv103, 16000
  %35 = add nuw nsw i64 %34, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.3 = or i64 %indvars.iv103, 4
  %36 = mul nuw nsw i64 %indvars.iv.next104.3, 16000
  %scevgep.1154 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1154, i8 0, i64 16000, i32 8, i1 false)
  %37 = mul nuw nsw i64 %indvars.iv.next104.3, 16000
  %38 = add nuw nsw i64 %37, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %39 = mul nuw nsw i64 %indvars.iv.next104.3, 16000
  %40 = add nuw nsw i64 %39, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %41 = mul nuw nsw i64 %indvars.iv.next104.3, 16000
  %42 = add nuw nsw i64 %41, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next104.3.1 = add nsw i64 %indvars.iv103, 8
  %exitcond106.3.1 = icmp eq i64 %indvars.iv.next104.3.1, 2000
  br i1 %exitcond106.3.1, label %for.cond69.preheader.preheader, label %for.inc62.3

for.cond69.preheader.preheader:                   ; preds = %for.inc62.3
  br label %for.cond69.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc58
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %for.inc58 ], [ 0, %entry ]
  %0 = add nuw nsw i64 %indvars.iv145, 4294967295
  %cmp288 = icmp sgt i64 %indvars.iv145, 0
  br i1 %cmp288, label %for.body3.preheader, label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv145, i64 0
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %cmp3690 = icmp sgt i64 %indvars.iv145, 0
  br i1 %cmp3690, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter134149 = and i64 %indvars.iv145, 1
  %lcmp.mod135 = icmp eq i64 %xtraiter134149, 0
  %1 = trunc i64 %0 to i32
  %2 = icmp eq i32 %1, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv145, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv139 = phi i64 [ %indvars.iv.next140, %for.inc55.us ], [ %indvars.iv145, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv145, i64 %indvars.iv139
  %3 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod135, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %4 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv139
  %5 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %4, %5
  %sub47.us.prol = fsub double %3, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %indvars.iv129.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %.unr136.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %3, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %2, label %for.inc55.us, label %for.inc48.us.preheader

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.preheader, %for.inc48.us
  %indvars.iv129 = phi i64 [ %indvars.iv.next130.1, %for.inc48.us ], [ %indvars.iv129.unr.ph, %for.inc48.us.preheader ]
  %6 = phi double [ %sub47.us.1, %for.inc48.us ], [ %.unr136.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv145, i64 %indvars.iv129
  %7 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv129, i64 %indvars.iv139
  %8 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %7, %8
  %sub47.us = fsub double %6, %mul46.us
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv145, i64 %indvars.iv.next130
  %9 = load double, double* %arrayidx41.us.1, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next130, i64 %indvars.iv139
  %10 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.1 = fmul double %9, %10
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.1
  %indvars.iv.next130.1 = add nuw nsw i64 %indvars.iv129, 2
  %exitcond133.1 = icmp eq i64 %indvars.iv.next130.1, %indvars.iv145
  br i1 %exitcond133.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond142 = icmp eq i64 %indvars.iv.next140, 2000
  br i1 %exitcond142, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %for.inc25 ], [ 0, %for.body3.preheader ]
  %11 = add nuw nsw i64 %indvars.iv122, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv145, i64 %indvars.iv122
  %12 = bitcast double* %arrayidx5 to i64*
  %13 = load i64, i64* %12, align 8
  %14 = bitcast i64 %13 to double
  %cmp784 = icmp sgt i64 %indvars.iv122, 0
  br i1 %cmp784, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter118150 = and i64 %indvars.iv122, 1
  %lcmp.mod119 = icmp eq i64 %xtraiter118150, 0
  br i1 %lcmp.mod119, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %15 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv122
  %16 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %15, %16
  %17 = bitcast i64 %13 to double
  %sub.prol = fsub double %17, %mul.prol
  %18 = bitcast double %sub.prol to i64
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %indvars.iv113.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.sroa.0.085.unr.ph = phi i64 [ %18, %for.inc.prol ], [ %13, %for.inc.preheader ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %19 = trunc i64 %11 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %for.inc25, label %for.inc.preheader164

for.inc.preheader164:                             ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader164, %for.inc
  %indvars.iv113 = phi i64 [ %indvars.iv.next114.1, %for.inc ], [ %indvars.iv113.unr.ph, %for.inc.preheader164 ]
  %w.sroa.0.085 = phi i64 [ %26, %for.inc ], [ %w.sroa.0.085.unr.ph, %for.inc.preheader164 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv145, i64 %indvars.iv113
  %21 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv113, i64 %indvars.iv122
  %22 = load double, double* %arrayidx16, align 8
  %mul = fmul double %21, %22
  %23 = bitcast i64 %w.sroa.0.085 to double
  %sub = fsub double %23, %mul
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv145, i64 %indvars.iv.next114
  %24 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next114, i64 %indvars.iv122
  %25 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %24, %25
  %sub.1 = fsub double %sub, %mul.1
  %26 = bitcast double %sub.1 to i64
  %indvars.iv.next114.1 = add nuw nsw i64 %indvars.iv113, 2
  %exitcond117.1 = icmp eq i64 %indvars.iv.next114.1, %indvars.iv122
  br i1 %exitcond117.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %.lcssa70 = phi double [ %14, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv122, i64 %indvars.iv122
  %27 = load double, double* %arrayidx20, align 8
  %div = fdiv double %.lcssa70, %27
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next123, %indvars.iv145
  br i1 %exitcond127, label %for.body30.lr.ph, label %for.body3

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit, %for.cond1.preheader, %for.body30.lr.ph
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next146, 2000
  br i1 %exitcond148, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv160 = phi i2 [ %indvars.iv.next161, %for.inc82 ], [ 0, %for.body63.preheader ]
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.inc82 ], [ 0, %for.body63.preheader ]
  %28 = zext i2 %indvars.iv160 to i64
  %29 = add nuw nsw i64 %28, 4294967295
  %30 = and i64 %29, 4294967295
  %31 = add nuw nsw i64 %30, 1
  %32 = add nuw nsw i64 %indvars.iv110, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv110
  %33 = load double, double* %arrayidx65, align 8
  %cmp6779 = icmp sgt i64 %indvars.iv110, 0
  br i1 %cmp6779, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %34 = trunc i64 %indvars.iv110 to i32
  %xtraiter104 = and i32 %34, 3
  %lcmp.mod105 = icmp eq i32 %xtraiter104, 0
  br i1 %lcmp.mod105, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.preheader, %for.inc77.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %35 = phi double [ %sub76.prol, %for.inc77.prol ], [ %33, %for.inc77.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc77.prol ], [ %xtraiter104, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.prol
  %36 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %37 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %36, %37
  %sub76.prol = fsub double %35, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !1

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %31, %for.inc77.prol.loopexit.loopexit ]
  %.unr = phi double [ %33, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %38 = trunc i64 %32 to i32
  %39 = icmp ult i32 %38, 3
  br i1 %39, label %for.inc82, label %for.inc77.preheader163

for.inc77.preheader163:                           ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.preheader163, %for.inc77
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc77 ], [ %indvars.iv.unr, %for.inc77.preheader163 ]
  %40 = phi double [ %sub76.3, %for.inc77 ], [ %.unr, %for.inc77.preheader163 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv
  %41 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %42 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %41, %42
  %sub76 = fsub double %40, %mul75
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx72.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx72.1, align 8
  %arrayidx74.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %44 = load double, double* %arrayidx74.1, align 8
  %mul75.1 = fmul double %43, %44
  %sub76.1 = fsub double %sub76, %mul75.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next.1
  %45 = load double, double* %arrayidx72.2, align 8
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %46 = load double, double* %arrayidx74.2, align 8
  %mul75.2 = fmul double %45, %46
  %sub76.2 = fsub double %sub76.1, %mul75.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx72.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv110, i64 %indvars.iv.next.2
  %47 = load double, double* %arrayidx72.3, align 8
  %arrayidx74.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %48 = load double, double* %arrayidx74.3, align 8
  %mul75.3 = fmul double %47, %48
  %sub76.3 = fsub double %sub76.2, %mul75.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv110
  br i1 %exitcond.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %.lcssa69 = phi double [ %33, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv110
  store double %.lcssa69, double* %arrayidx81, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond = icmp eq i64 %indvars.iv.next111, 2000
  %indvars.iv.next161 = add i2 %indvars.iv160, 1
  br i1 %exitcond, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %for.inc112 ], [ 2000, %for.body88.preheader ]
  %indvar = phi i32 [ %indvar.next, %for.inc112 ], [ 0, %for.body88.preheader ]
  %indvars.iv.next101 = add nsw i64 %indvars.iv100, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next101
  %49 = bitcast double* %arrayidx90 to i64*
  %50 = load i64, i64* %49, align 8
  %51 = bitcast i64 %50 to double
  %cmp9273 = icmp slt i64 %indvars.iv100, 2000
  br i1 %cmp9273, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.preheader
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next101, i64 %indvars.iv100
  %52 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv100
  %53 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %52, %53
  %54 = bitcast i64 %50 to double
  %sub101.prol = fsub double %54, %mul100.prol
  %55 = bitcast double %sub101.prol to i64
  %indvars.iv.next99.prol = add nuw nsw i64 %indvars.iv100, 1
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol, %for.inc102.preheader
  %indvars.iv98.unr.ph = phi i64 [ %indvars.iv.next99.prol, %for.inc102.prol ], [ %indvars.iv100, %for.inc102.preheader ]
  %w.sroa.0.374.unr.ph = phi i64 [ %55, %for.inc102.prol ], [ %50, %for.inc102.preheader ]
  %sub101.lcssa.unr.ph = phi double [ %sub101.prol, %for.inc102.prol ], [ undef, %for.inc102.preheader ]
  %56 = icmp eq i32 %indvar, 1
  br i1 %56, label %for.inc112, label %for.inc102.preheader162

for.inc102.preheader162:                          ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.preheader162, %for.inc102
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.1, %for.inc102 ], [ %indvars.iv98.unr.ph, %for.inc102.preheader162 ]
  %w.sroa.0.374 = phi i64 [ %62, %for.inc102 ], [ %w.sroa.0.374.unr.ph, %for.inc102.preheader162 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next101, i64 %indvars.iv98
  %57 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv98
  %58 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %57, %58
  %59 = bitcast i64 %w.sroa.0.374 to double
  %sub101 = fsub double %59, %mul100
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, 1
  %arrayidx97.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next101, i64 %indvars.iv.next99
  %60 = load double, double* %arrayidx97.1, align 8
  %arrayidx99.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next99
  %61 = load double, double* %arrayidx99.1, align 8
  %mul100.1 = fmul double %60, %61
  %sub101.1 = fsub double %sub101, %mul100.1
  %62 = bitcast double %sub101.1 to i64
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next99.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 2000
  br i1 %exitcond.1, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %.lcssa = phi double [ %51, %for.body88 ], [ %sub101.lcssa.unr.ph, %for.inc102.prol.loopexit ], [ %sub101.1, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next101, i64 %indvars.iv.next101
  %63 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %.lcssa, %63
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next101
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv100, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.inc112
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
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

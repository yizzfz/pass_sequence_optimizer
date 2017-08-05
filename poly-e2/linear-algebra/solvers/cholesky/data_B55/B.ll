; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %arraydecay31 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay31)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %entry, %for.inc23
  %indvars.iv119 = phi i64 [ 0, %entry ], [ %indvars.iv.next120, %for.inc23 ]
  %indvars.iv117 = phi i64 [ 1, %entry ], [ %indvars.iv.next118, %for.inc23 ]
  %0 = mul nuw nsw i64 %indvars.iv119, 2001
  %1 = add nuw nsw i64 %0, 1
  %scevgep115 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %1
  %2 = sub nsw i64 1998, %indvars.iv119
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  %cmp969 = icmp slt i64 %indvars.iv.next120, 2000
  br i1 %cmp969, label %for.inc23.loopexit, label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.inc ], [ 0, %for.inc.lr.ph ]
  %5 = sub nsw i64 0, %indvars.iv102
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv119, i64 %indvars.iv102
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next103, %indvars.iv117
  br i1 %exitcond108, label %for.cond8.preheader, label %for.inc

for.inc23.loopexit:                               ; preds = %for.cond8.preheader
  %7 = add nuw nsw i64 %4, 8
  %scevgep115116 = bitcast double* %scevgep115 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep115116, i8 0, i64 %7, i32 8, i1 false)
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv119, i64 %indvars.iv119
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next120, 2000
  br i1 %exitcond122, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.inc41.3

for.cond48.preheader:                             ; preds = %for.cond48.preheader.preheader, %for.inc75
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.inc75 ], [ 0, %for.cond48.preheader.preheader ]
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.inc72, %for.cond48.preheader
  %indvars.iv83 = phi i64 [ 0, %for.cond48.preheader ], [ %indvars.iv.next84, %for.inc72 ]
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv83, i64 %indvars.iv87
  br label %for.inc69

for.inc69:                                        ; preds = %for.cond52.preheader, %for.inc69
  %indvars.iv77 = phi i64 [ %indvars.iv.next78.1, %for.inc69 ], [ 0, %for.cond52.preheader ]
  %9 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv87
  %10 = load double, double* %arrayidx63, align 8
  %mul = fmul double %9, %10
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv83, i64 %indvars.iv77
  %11 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %11, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %12 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next78, i64 %indvars.iv87
  %13 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %12, %13
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next78
  %14 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %14, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next78.1 = add nuw nsw i64 %indvars.iv77, 2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next78.1, 2000
  br i1 %exitcond80.1, label %for.inc72, label %for.inc69

for.inc72:                                        ; preds = %for.inc69
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 2000
  br i1 %exitcond86, label %for.inc75, label %for.cond52.preheader

for.inc75:                                        ; preds = %for.inc72
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next88, 2000
  br i1 %exitcond90, label %for.cond82.preheader.preheader, label %for.cond48.preheader

for.cond82.preheader.preheader:                   ; preds = %for.inc75
  br label %for.cond82.preheader

for.cond82.preheader:                             ; preds = %for.cond82.preheader.preheader, %for.inc97
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.inc97 ], [ 0, %for.cond82.preheader.preheader ]
  br label %for.inc94

for.inc94:                                        ; preds = %for.cond82.preheader, %for.inc94
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc94 ], [ 0, %for.cond82.preheader ]
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv74, i64 %indvars.iv
  %15 = bitcast double* %arrayidx89 to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv
  %17 = bitcast double* %arrayidx93 to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv74, i64 %indvars.iv.next
  %18 = bitcast double* %arrayidx89.1 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv.next
  %20 = bitcast double* %arrayidx93.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv74, i64 %indvars.iv.next.1
  %21 = bitcast double* %arrayidx89.2 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv.next.1
  %23 = bitcast double* %arrayidx93.2 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv74, i64 %indvars.iv.next.2
  %24 = bitcast double* %arrayidx89.3 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv.next.2
  %26 = bitcast double* %arrayidx93.3 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 2000
  br i1 %exitcond.3, label %for.inc97, label %for.inc94

for.inc97:                                        ; preds = %for.inc94
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond, label %for.end99, label %for.cond82.preheader

for.end99:                                        ; preds = %for.inc97
  tail call void @free(i8* %call) #3
  ret void

for.inc41.3:                                      ; preds = %for.inc41.3, %for.end25
  %indvars.iv95 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next96.3.1, %for.inc41.3 ]
  %27 = mul nuw nsw i64 %indvars.iv95, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %28 = mul nuw nsw i64 %indvars.iv95, 16000
  %29 = add nuw nsw i64 %28, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %30 = mul nuw nsw i64 %indvars.iv95, 16000
  %31 = add nuw nsw i64 %30, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %31
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %32 = mul nuw nsw i64 %indvars.iv95, 16000
  %33 = add nuw nsw i64 %32, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %33
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96.3 = or i64 %indvars.iv95, 4
  %34 = mul nuw nsw i64 %indvars.iv.next96.3, 16000
  %scevgep.1134 = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1134, i8 0, i64 16000, i32 8, i1 false)
  %35 = mul nuw nsw i64 %indvars.iv.next96.3, 16000
  %36 = add nuw nsw i64 %35, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 16000, i32 8, i1 false)
  %37 = mul nuw nsw i64 %indvars.iv.next96.3, 16000
  %38 = add nuw nsw i64 %37, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 16000, i32 8, i1 false)
  %39 = mul nuw nsw i64 %indvars.iv.next96.3, 16000
  %40 = add nuw nsw i64 %39, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96.3.1 = add nsw i64 %indvars.iv95, 8
  %exitcond98.3.1 = icmp eq i64 %indvars.iv.next96.3.1, 2000
  br i1 %exitcond98.3.1, label %for.cond48.preheader.preheader, label %for.inc41.3

for.cond48.preheader.preheader:                   ; preds = %for.inc41.3
  br label %for.cond48.preheader
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc56
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc56 ], [ 0, %entry ]
  %0 = add i64 %indvars.iv60, -2
  %1 = add nuw nsw i64 %indvars.iv60, 4294967295
  %cmp234 = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp234, label %for.cond4.preheader.preheader, label %for.inc56

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 0
  br label %for.cond4.preheader

for.cond28.preheader:                             ; preds = %for.inc25
  %cmp2937 = icmp sgt i64 %indvars.iv60, 0
  br i1 %cmp2937, label %for.inc45.lr.ph, label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.cond28.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv60
  %xtraiter5664 = and i64 %indvars.iv60, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter5664, 0
  br i1 %lcmp.mod57, label %for.inc45.prol.loopexit, label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.lr.ph
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 0
  %2 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %2, %2
  %3 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol, %for.inc45.lr.ph
  %indvars.iv51.unr.ph = phi i64 [ 1, %for.inc45.prol ], [ 0, %for.inc45.lr.ph ]
  %4 = trunc i64 %1 to i32
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %for.inc56, label %for.inc45.preheader

for.inc45.preheader:                              ; preds = %for.inc45.prol.loopexit
  %6 = sub i64 %0, %indvars.iv51.unr.ph
  %7 = lshr i64 %6, 1
  %8 = and i64 %7, 1
  %lcmp.mod68 = icmp eq i64 %8, 0
  br i1 %lcmp.mod68, label %for.inc45.prol.preheader, label %for.inc45.prol.loopexit67.unr-lcssa

for.inc45.prol.preheader:                         ; preds = %for.inc45.preheader
  br label %for.inc45.prol69

for.inc45.prol69:                                 ; preds = %for.inc45.prol.preheader
  %arrayidx34.prol70 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv51.unr.ph
  %9 = load double, double* %arrayidx34.prol70, align 8
  %mul39.prol71 = fmul double %9, %9
  %10 = load double, double* %arrayidx43, align 8
  %sub44.prol72 = fsub double %10, %mul39.prol71
  store double %sub44.prol72, double* %arrayidx43, align 8
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.prol
  %11 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %11, %11
  %sub44.1.prol = fsub double %sub44.prol72, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next52.1.prol = or i64 %indvars.iv51.unr.ph, 2
  br label %for.inc45.prol.loopexit67.unr-lcssa

for.inc45.prol.loopexit67.unr-lcssa:              ; preds = %for.inc45.preheader, %for.inc45.prol69
  %indvars.iv51.unr.ph73 = phi i64 [ %indvars.iv.next52.1.prol, %for.inc45.prol69 ], [ %indvars.iv51.unr.ph, %for.inc45.preheader ]
  br label %for.inc45.prol.loopexit67

for.inc45.prol.loopexit67:                        ; preds = %for.inc45.prol.loopexit67.unr-lcssa
  %12 = icmp eq i64 %7, 0
  br i1 %12, label %for.inc56.loopexit, label %for.inc45.preheader.new

for.inc45.preheader.new:                          ; preds = %for.inc45.prol.loopexit67
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %13 = add nuw nsw i64 %indvars.iv46, 4294967295
  %cmp532 = icmp sgt i64 %indvars.iv46, 0
  br i1 %cmp532, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv46
  %xtraiter65 = and i64 %indvars.iv46, 1
  %lcmp.mod = icmp eq i64 %xtraiter65, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %14 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  %15 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %14, %15
  %16 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %16, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %17 = trunc i64 %13 to i32
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %for.inc25, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ %indvars.iv.unr.ph, %for.inc.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv
  %19 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %20 = load double, double* %arrayidx12, align 8
  %mul = fmul double %19, %20
  %21 = load double, double* %arrayidx16, align 8
  %sub = fsub double %21, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next
  %22 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %23 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %22, %23
  %24 = load double, double* %arrayidx16, align 8
  %sub.1 = fsub double %24, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv46
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv46
  %25 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv46
  %26 = load double, double* %arrayidx24, align 8
  %div = fdiv double %26, %25
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %indvars.iv60
  br i1 %exitcond, label %for.cond28.preheader, label %for.cond4.preheader

for.inc45:                                        ; preds = %for.inc45, %for.inc45.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph73, %for.inc45.preheader.new ], [ %indvars.iv.next52.1.1, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv51
  %27 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %27, %27
  %28 = load double, double* %arrayidx43, align 8
  %sub44 = fsub double %28, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52
  %29 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %29, %29
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %arrayidx34.174 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.1
  %30 = load double, double* %arrayidx34.174, align 8
  %mul39.175 = fmul double %30, %30
  %sub44.176 = fsub double %sub44.1, %mul39.175
  store double %sub44.176, double* %arrayidx43, align 8
  %indvars.iv.next52.177 = add nsw i64 %indvars.iv51, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv.next52.177
  %31 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %31, %31
  %sub44.1.1 = fsub double %sub44.176, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next52.1.1 = add nsw i64 %indvars.iv51, 4
  %exitcond55.1.1 = icmp eq i64 %indvars.iv.next52.1.1, %indvars.iv60
  br i1 %exitcond55.1.1, label %for.inc56.loopexit.unr-lcssa, label %for.inc45

for.inc56.loopexit.unr-lcssa:                     ; preds = %for.inc45
  br label %for.inc56.loopexit

for.inc56.loopexit:                               ; preds = %for.inc45.prol.loopexit67, %for.inc56.loopexit.unr-lcssa
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.cond1.preheader, %for.inc45.prol.loopexit, %for.cond28.preheader
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv60
  %32 = load double, double* %arrayidx51, align 8
  %call = tail call double @sqrt(double %32) #3
  store double %call, double* %arrayidx51, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond63, label %for.end58, label %for.cond1.preheader

for.end58:                                        ; preds = %for.inc56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %entry, %for.inc10
  %indvars.iv18 = phi i64 [ 0, %entry ], [ %indvars.iv.next19, %for.inc10 ]
  %indvars.iv16 = phi i64 [ 1, %entry ], [ %indvars.iv.next17, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv18, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body4.lr.ph ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv16
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond22, label %for.end12, label %for.body4.lr.ph

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

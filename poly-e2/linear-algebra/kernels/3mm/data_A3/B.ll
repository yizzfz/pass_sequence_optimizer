; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %arraydecay = bitcast i8* %call1 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call2 to [900 x double]*
  %arraydecay8 = bitcast i8* %call4 to [1200 x double]*
  %arraydecay9 = bitcast i8* %call5 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay10 = bitcast i8* %call to [900 x double]*
  %arraydecay13 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay16 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %arraydecay10, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [1100 x double]* %arraydecay16)
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
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %arraydecay16)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1100 x double]* %D) unnamed_addr #2 {
entry:
  %cmp50 = icmp sgt i32 %ni, 0
  br i1 %cmp50, label %for.cond1.preheader.lr.ph, label %for.cond11.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp248 = icmp sgt i32 %nk, 0
  %mul4 = mul nsw i32 %ni, 5
  %conv5 = sitofp i32 %mul4 to double
  br i1 %cmp248, label %for.cond1.preheader.us.preheader, label %for.cond37.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %nk to i64
  %1 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc8.us, %for.cond1.preheader.us.preheader
  %indvars.iv93 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next94, %for.inc8.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %2 = mul nuw nsw i64 %indvars.iv87, %indvars.iv93
  %3 = add nuw nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv5
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv87
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next88, %0
  br i1 %exitcond103, label %for.inc8.us, label %for.body3.us

for.inc8.us:                                      ; preds = %for.body3.us
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next94, %1
  br i1 %exitcond104, label %for.cond11.preheader.loopexit, label %for.cond1.preheader.us

for.cond11.preheader.loopexit:                    ; preds = %for.inc8.us
  br label %for.cond11.preheader

for.cond11.preheader:                             ; preds = %for.cond11.preheader.loopexit, %entry
  %cmp1245 = icmp sgt i32 %nk, 0
  br i1 %cmp1245, label %for.cond15.preheader.lr.ph, label %for.cond37.preheader

for.cond15.preheader.lr.ph:                       ; preds = %for.cond11.preheader
  %cmp1643 = icmp sgt i32 %nj, 0
  %mul24 = mul nsw i32 %nj, 5
  %conv25 = sitofp i32 %mul24 to double
  br i1 %cmp1643, label %for.cond15.preheader.us.preheader, label %for.cond62.preheader

for.cond15.preheader.us.preheader:                ; preds = %for.cond15.preheader.lr.ph
  %5 = zext i32 %nj to i64
  %6 = zext i32 %nk to i64
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.inc34.us, %for.cond15.preheader.us.preheader
  %indvars.iv82 = phi i64 [ 0, %for.cond15.preheader.us.preheader ], [ %indvars.iv.next83, %for.inc34.us ]
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us, %for.cond15.preheader.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.body18.us ], [ 0, %for.cond15.preheader.us ]
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %7 = mul nuw nsw i64 %indvars.iv.next77, %indvars.iv82
  %8 = add nuw nsw i64 %7, 2
  %9 = trunc i64 %8 to i32
  %rem22.us = srem i32 %9, %nj
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, %conv25
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv82, i64 %indvars.iv76
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond101 = icmp eq i64 %indvars.iv.next77, %5
  br i1 %exitcond101, label %for.inc34.us, label %for.body18.us

for.inc34.us:                                     ; preds = %for.body18.us
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next83, %6
  br i1 %exitcond102, label %for.cond37.preheader.loopexit, label %for.cond15.preheader.us

for.cond37.preheader.loopexit:                    ; preds = %for.inc34.us
  br label %for.cond37.preheader

for.cond37.preheader:                             ; preds = %for.cond37.preheader.loopexit, %for.cond1.preheader.lr.ph, %for.cond11.preheader
  %cmp3840 = icmp sgt i32 %nj, 0
  br i1 %cmp3840, label %for.cond41.preheader.lr.ph, label %for.cond62.preheader

for.cond41.preheader.lr.ph:                       ; preds = %for.cond37.preheader
  %cmp4238 = icmp sgt i32 %nm, 0
  %mul49 = mul nsw i32 %nl, 5
  %conv50 = sitofp i32 %mul49 to double
  br i1 %cmp4238, label %for.cond41.preheader.us.preheader, label %for.end87

for.cond41.preheader.us.preheader:                ; preds = %for.cond41.preheader.lr.ph
  %10 = zext i32 %nm to i64
  %11 = zext i32 %nj to i64
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.inc59.us, %for.cond41.preheader.us.preheader
  %indvars.iv71 = phi i64 [ 0, %for.cond41.preheader.us.preheader ], [ %indvars.iv.next72, %for.inc59.us ]
  br label %for.body44.us

for.body44.us:                                    ; preds = %for.body44.us, %for.cond41.preheader.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.body44.us ], [ 0, %for.cond41.preheader.us ]
  %12 = add nuw nsw i64 %indvars.iv65, 3
  %13 = mul nuw nsw i64 %12, %indvars.iv71
  %14 = trunc i64 %13 to i32
  %rem47.us = srem i32 %14, %nl
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, %conv50
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv71, i64 %indvars.iv65
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next66, %10
  br i1 %exitcond99, label %for.inc59.us, label %for.body44.us

for.inc59.us:                                     ; preds = %for.body44.us
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next72, %11
  br i1 %exitcond100, label %for.cond62.preheader.loopexit, label %for.cond41.preheader.us

for.cond62.preheader.loopexit:                    ; preds = %for.inc59.us
  br label %for.cond62.preheader

for.cond62.preheader:                             ; preds = %for.cond62.preheader.loopexit, %for.cond15.preheader.lr.ph, %for.cond37.preheader
  %cmp6335 = icmp sgt i32 %nm, 0
  br i1 %cmp6335, label %for.cond66.preheader.lr.ph, label %for.end87

for.cond66.preheader.lr.ph:                       ; preds = %for.cond62.preheader
  %cmp6733 = icmp sgt i32 %nl, 0
  %mul75 = mul nsw i32 %nk, 5
  %conv76 = sitofp i32 %mul75 to double
  br i1 %cmp6733, label %for.cond66.preheader.us.preheader, label %for.end87

for.cond66.preheader.us.preheader:                ; preds = %for.cond66.preheader.lr.ph
  %15 = zext i32 %nl to i64
  %16 = zext i32 %nm to i64
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.inc85.us, %for.cond66.preheader.us.preheader
  %indvars.iv60 = phi i64 [ 0, %for.cond66.preheader.us.preheader ], [ %indvars.iv.next61, %for.inc85.us ]
  br label %for.body69.us

for.body69.us:                                    ; preds = %for.body69.us, %for.cond66.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body69.us ], [ 0, %for.cond66.preheader.us ]
  %17 = add nuw nsw i64 %indvars.iv, 2
  %18 = mul nuw nsw i64 %17, %indvars.iv60
  %19 = add nuw nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %rem73.us = srem i32 %20, %nk
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, %conv76
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv60, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next, %15
  br i1 %exitcond98, label %for.inc85.us, label %for.body69.us

for.inc85.us:                                     ; preds = %for.body69.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, %16
  br i1 %exitcond, label %for.end87.loopexit, label %for.cond66.preheader.us

for.end87.loopexit:                               ; preds = %for.inc85.us
  br label %for.end87

for.end87:                                        ; preds = %for.end87.loopexit, %for.cond41.preheader.lr.ph, %for.cond66.preheader.lr.ph, %for.cond62.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* %E, [1000 x double]* %A, [900 x double]* %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* %G) unnamed_addr #2 {
entry:
  %cmp61 = icmp sgt i32 %ni, 0
  br i1 %cmp61, label %for.cond1.preheader.lr.ph, label %for.cond27.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp259 = icmp sgt i32 %nj, 0
  %cmp757 = icmp sgt i32 %nk, 0
  br i1 %cmp259, label %for.cond1.preheader.us.preheader, label %for.cond66.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %nj, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %4 = zext i32 %nj to i64
  %5 = zext i32 %ni to i64
  %xtraiter174 = and i32 %nk, 1
  %lcmp.mod175 = icmp eq i32 %xtraiter174, 0
  %6 = icmp eq i32 %nk, 1
  %wide.trip.count172.1 = zext i32 %nk to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc24.us, %for.cond1.preheader.us.preheader
  %indvars.iv183 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next184, %for.inc24.us ]
  br i1 %cmp757, label %for.body3.us.us.preheader, label %for.inc24.us.loopexit127

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader.us
  %arrayidx12.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv183, i64 0
  br label %for.body3.us.us

for.inc24.us.loopexit127:                         ; preds = %for.cond1.preheader.us
  %scevgep168 = getelementptr [900 x double], [900 x double]* %E, i64 %indvars.iv183, i64 0
  %scevgep168169 = bitcast double* %scevgep168 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep168169, i8 0, i64 %3, i32 8, i1 false)
  br label %for.inc24.us

for.inc24.us.loopexit:                            ; preds = %for.inc21.us.us
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us.loopexit, %for.inc24.us.loopexit127
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next184, %5
  br i1 %exitcond192, label %for.cond27.preheader.loopexit, label %for.cond1.preheader.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.inc21.us.us
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %for.inc21.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv183, i64 %indvars.iv177
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br i1 %lcmp.mod175, label %for.body8.us.us.prol.loopexit, label %for.body8.us.us.prol

for.body8.us.us.prol:                             ; preds = %for.body3.us.us
  %7 = load double, double* %arrayidx12.us.us.prol, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv177
  %8 = load double, double* %arrayidx16.us.us.prol, align 8
  %mul.us.us.prol = fmul double %7, %8
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx5.us.us, align 8
  br label %for.body8.us.us.prol.loopexit

for.body8.us.us.prol.loopexit:                    ; preds = %for.body8.us.us.prol, %for.body3.us.us
  %indvars.iv170.unr.ph = phi i64 [ 1, %for.body8.us.us.prol ], [ 0, %for.body3.us.us ]
  %.unr176.ph = phi double [ %add.us.us.prol, %for.body8.us.us.prol ], [ 0.000000e+00, %for.body3.us.us ]
  br i1 %6, label %for.inc21.us.us, label %for.body8.us.us.preheader

for.body8.us.us.preheader:                        ; preds = %for.body8.us.us.prol.loopexit
  br label %for.body8.us.us

for.inc21.us.us.loopexit:                         ; preds = %for.body8.us.us
  br label %for.inc21.us.us

for.inc21.us.us:                                  ; preds = %for.inc21.us.us.loopexit, %for.body8.us.us.prol.loopexit
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond191 = icmp eq i64 %indvars.iv.next178, %4
  br i1 %exitcond191, label %for.inc24.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.body8.us.us.preheader, %for.body8.us.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171.1, %for.body8.us.us ], [ %indvars.iv170.unr.ph, %for.body8.us.us.preheader ]
  %9 = phi double [ %add.us.us.1, %for.body8.us.us ], [ %.unr176.ph, %for.body8.us.us.preheader ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv170
  %10 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv170, i64 %indvars.iv177
  %11 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %10, %11
  %add.us.us = fadd double %9, %mul.us.us
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv183, i64 %indvars.iv.next171
  %12 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next171, i64 %indvars.iv177
  %13 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %12, %13
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next171.1 = add nuw nsw i64 %indvars.iv170, 2
  %exitcond173.1 = icmp eq i64 %indvars.iv.next171.1, %wide.trip.count172.1
  br i1 %exitcond173.1, label %for.inc21.us.us.loopexit, label %for.body8.us.us

for.cond27.preheader.loopexit:                    ; preds = %for.inc24.us
  br label %for.cond27.preheader

for.cond27.preheader:                             ; preds = %for.cond27.preheader.loopexit, %entry
  %cmp2855 = icmp sgt i32 %nj, 0
  br i1 %cmp2855, label %for.cond30.preheader.lr.ph, label %for.cond63.preheader

for.cond30.preheader.lr.ph:                       ; preds = %for.cond27.preheader
  %cmp3153 = icmp sgt i32 %nl, 0
  %cmp3851 = icmp sgt i32 %nm, 0
  br i1 %cmp3153, label %for.cond30.preheader.us.preheader, label %for.cond63.preheader

for.cond30.preheader.us.preheader:                ; preds = %for.cond30.preheader.lr.ph
  %14 = add i32 %nl, -1
  %15 = zext i32 %14 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = add nuw nsw i64 %16, 8
  %18 = zext i32 %nl to i64
  %19 = zext i32 %nj to i64
  %xtraiter150 = and i32 %nm, 1
  %lcmp.mod151 = icmp eq i32 %xtraiter150, 0
  %20 = icmp eq i32 %nm, 1
  %wide.trip.count148.1 = zext i32 %nm to i64
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.inc60.us, %for.cond30.preheader.us.preheader
  %indvars.iv159 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next160, %for.inc60.us ]
  br i1 %cmp3851, label %for.body32.us.us.preheader, label %for.inc60.us.loopexit125

for.body32.us.us.preheader:                       ; preds = %for.cond30.preheader.us
  %arrayidx43.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv159, i64 0
  br label %for.body32.us.us

for.inc60.us.loopexit125:                         ; preds = %for.cond30.preheader.us
  %scevgep144 = getelementptr [1100 x double], [1100 x double]* %F, i64 %indvars.iv159, i64 0
  %scevgep144145 = bitcast double* %scevgep144 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep144145, i8 0, i64 %17, i32 8, i1 false)
  br label %for.inc60.us

for.inc60.us.loopexit:                            ; preds = %for.inc57.us.us
  br label %for.inc60.us

for.inc60.us:                                     ; preds = %for.inc60.us.loopexit, %for.inc60.us.loopexit125
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %exitcond190 = icmp eq i64 %indvars.iv.next160, %19
  br i1 %exitcond190, label %for.cond63.preheader.loopexit, label %for.cond30.preheader.us

for.body32.us.us:                                 ; preds = %for.body32.us.us.preheader, %for.inc57.us.us
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %for.inc57.us.us ], [ 0, %for.body32.us.us.preheader ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv159, i64 %indvars.iv153
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br i1 %lcmp.mod151, label %for.body39.us.us.prol.loopexit, label %for.body39.us.us.prol

for.body39.us.us.prol:                            ; preds = %for.body32.us.us
  %21 = load double, double* %arrayidx43.us.us.prol, align 8
  %arrayidx47.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 0, i64 %indvars.iv153
  %22 = load double, double* %arrayidx47.us.us.prol, align 8
  %mul48.us.us.prol = fmul double %21, %22
  %add53.us.us.prol = fadd double %mul48.us.us.prol, 0.000000e+00
  store double %add53.us.us.prol, double* %arrayidx36.us.us, align 8
  br label %for.body39.us.us.prol.loopexit

for.body39.us.us.prol.loopexit:                   ; preds = %for.body39.us.us.prol, %for.body32.us.us
  %indvars.iv146.unr.ph = phi i64 [ 1, %for.body39.us.us.prol ], [ 0, %for.body32.us.us ]
  %.unr152.ph = phi double [ %add53.us.us.prol, %for.body39.us.us.prol ], [ 0.000000e+00, %for.body32.us.us ]
  br i1 %20, label %for.inc57.us.us, label %for.body39.us.us.preheader

for.body39.us.us.preheader:                       ; preds = %for.body39.us.us.prol.loopexit
  br label %for.body39.us.us

for.inc57.us.us.loopexit:                         ; preds = %for.body39.us.us
  br label %for.inc57.us.us

for.inc57.us.us:                                  ; preds = %for.inc57.us.us.loopexit, %for.body39.us.us.prol.loopexit
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %exitcond189 = icmp eq i64 %indvars.iv.next154, %18
  br i1 %exitcond189, label %for.inc60.us.loopexit, label %for.body32.us.us

for.body39.us.us:                                 ; preds = %for.body39.us.us.preheader, %for.body39.us.us
  %indvars.iv146 = phi i64 [ %indvars.iv.next147.1, %for.body39.us.us ], [ %indvars.iv146.unr.ph, %for.body39.us.us.preheader ]
  %23 = phi double [ %add53.us.us.1, %for.body39.us.us ], [ %.unr152.ph, %for.body39.us.us.preheader ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv159, i64 %indvars.iv146
  %24 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv146, i64 %indvars.iv153
  %25 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %24, %25
  %add53.us.us = fadd double %23, %mul48.us.us
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv159, i64 %indvars.iv.next147
  %26 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next147, i64 %indvars.iv153
  %27 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %26, %27
  %add53.us.us.1 = fadd double %add53.us.us, %mul48.us.us.1
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next147.1 = add nuw nsw i64 %indvars.iv146, 2
  %exitcond149.1 = icmp eq i64 %indvars.iv.next147.1, %wide.trip.count148.1
  br i1 %exitcond149.1, label %for.inc57.us.us.loopexit, label %for.body39.us.us

for.cond63.preheader.loopexit:                    ; preds = %for.inc60.us
  br label %for.cond63.preheader

for.cond63.preheader:                             ; preds = %for.cond63.preheader.loopexit, %for.cond30.preheader.lr.ph, %for.cond27.preheader
  %cmp2855194 = phi i1 [ false, %for.cond27.preheader ], [ true, %for.cond30.preheader.lr.ph ], [ true, %for.cond63.preheader.loopexit ]
  br i1 %cmp61, label %for.cond66.preheader.lr.ph, label %for.end98

for.cond66.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond63.preheader
  %cmp2855194195 = phi i1 [ %cmp2855194, %for.cond63.preheader ], [ false, %for.cond1.preheader.lr.ph ]
  %cmp6747 = icmp sgt i32 %nl, 0
  br i1 %cmp6747, label %for.cond66.preheader.us.preheader, label %for.end98

for.cond66.preheader.us.preheader:                ; preds = %for.cond66.preheader.lr.ph
  %28 = add i32 %nl, -1
  %29 = zext i32 %28 to i64
  %30 = shl nuw nsw i64 %29, 3
  %31 = add nuw nsw i64 %30, 8
  %32 = zext i32 %nl to i64
  %33 = zext i32 %ni to i64
  %xtraiter = and i32 %nj, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %34 = icmp eq i32 %nj, 1
  %wide.trip.count.1 = zext i32 %nj to i64
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.inc96.us, %for.cond66.preheader.us.preheader
  %indvars.iv135 = phi i64 [ 0, %for.cond66.preheader.us.preheader ], [ %indvars.iv.next136, %for.inc96.us ]
  br i1 %cmp2855194195, label %for.body68.us.us.preheader, label %for.inc96.us.loopexit123

for.body68.us.us.preheader:                       ; preds = %for.cond66.preheader.us
  %arrayidx79.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv135, i64 0
  br label %for.body68.us.us

for.inc96.us.loopexit123:                         ; preds = %for.cond66.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %G, i64 %indvars.iv135, i64 0
  %scevgep129 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep129, i8 0, i64 %31, i32 8, i1 false)
  br label %for.inc96.us

for.inc96.us.loopexit:                            ; preds = %for.inc93.us.us
  br label %for.inc96.us

for.inc96.us:                                     ; preds = %for.inc96.us.loopexit, %for.inc96.us.loopexit123
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond = icmp eq i64 %indvars.iv.next136, %33
  br i1 %exitcond, label %for.end98.loopexit, label %for.cond66.preheader.us

for.body68.us.us:                                 ; preds = %for.body68.us.us.preheader, %for.inc93.us.us
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %for.inc93.us.us ], [ 0, %for.body68.us.us.preheader ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv135, i64 %indvars.iv130
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br i1 %lcmp.mod, label %for.body75.us.us.prol.loopexit, label %for.body75.us.us.prol

for.body75.us.us.prol:                            ; preds = %for.body68.us.us
  %35 = load double, double* %arrayidx79.us.us.prol, align 8
  %arrayidx83.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 0, i64 %indvars.iv130
  %36 = load double, double* %arrayidx83.us.us.prol, align 8
  %mul84.us.us.prol = fmul double %35, %36
  %add89.us.us.prol = fadd double %mul84.us.us.prol, 0.000000e+00
  store double %add89.us.us.prol, double* %arrayidx72.us.us, align 8
  br label %for.body75.us.us.prol.loopexit

for.body75.us.us.prol.loopexit:                   ; preds = %for.body75.us.us.prol, %for.body68.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body75.us.us.prol ], [ 0, %for.body68.us.us ]
  %.unr.ph = phi double [ %add89.us.us.prol, %for.body75.us.us.prol ], [ 0.000000e+00, %for.body68.us.us ]
  br i1 %34, label %for.inc93.us.us, label %for.body75.us.us.preheader

for.body75.us.us.preheader:                       ; preds = %for.body75.us.us.prol.loopexit
  br label %for.body75.us.us

for.inc93.us.us.loopexit:                         ; preds = %for.body75.us.us
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit, %for.body75.us.us.prol.loopexit
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond188 = icmp eq i64 %indvars.iv.next131, %32
  br i1 %exitcond188, label %for.inc96.us.loopexit, label %for.body68.us.us

for.body75.us.us:                                 ; preds = %for.body75.us.us.preheader, %for.body75.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body75.us.us ], [ %indvars.iv.unr.ph, %for.body75.us.us.preheader ]
  %37 = phi double [ %add89.us.us.1, %for.body75.us.us ], [ %.unr.ph, %for.body75.us.us.preheader ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv135, i64 %indvars.iv
  %38 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv130
  %39 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %38, %39
  %add89.us.us = fadd double %37, %mul84.us.us
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv135, i64 %indvars.iv.next
  %40 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv130
  %41 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %40, %41
  %add89.us.us.1 = fadd double %add89.us.us, %mul84.us.us.1
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc93.us.us.loopexit, label %for.body75.us.us

for.end98.loopexit:                               ; preds = %for.inc96.us
  br label %for.end98

for.end98:                                        ; preds = %for.end98.loopexit, %for.cond66.preheader.lr.ph, %for.cond63.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1100 x double]* %G) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp8 = icmp sgt i32 %ni, 0
  %cmp36 = icmp sgt i32 %nl, 0
  %or.cond = and i1 %cmp8, %cmp36
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %ni to i64
  %4 = zext i32 %nl to i64
  %5 = zext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.inc10.us ]
  %6 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us ], [ 0, %for.cond2.preheader.us ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv13, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond19, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %5
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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

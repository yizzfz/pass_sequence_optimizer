; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
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
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay10 = bitcast i8* %call to [900 x double]*
  %arraydecay13 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay16 = bitcast i8* %call6 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %arraydecay10, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [1100 x double]* %arraydecay16)
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
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %arraydecay16)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1100 x double]* %D) #0 {
entry:
  br i1 true, label %for.body.lr.ph, label %for.end10

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.end36

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc8_crit_edge.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.cond1.for.inc8_crit_edge.us ], [ 0, %for.body.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body.us
  %indvars.iv68 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next69, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv68, %indvars.iv74
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 4.000000e+03
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv68
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next69, 1000
  br i1 %exitcond73, label %for.cond1.for.inc8_crit_edge.us, label %for.body3.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 800
  br i1 %exitcond77, label %for.end10.loopexit, label %for.body.us

for.end10.loopexit:                               ; preds = %for.cond1.for.inc8_crit_edge.us
  br label %for.end10

for.end10:                                        ; preds = %for.end10.loopexit, %entry
  br i1 true, label %for.body14.lr.ph, label %for.end36

for.body14.lr.ph:                                 ; preds = %for.end10
  br i1 true, label %for.body14.us.preheader, label %for.end61

for.body14.us.preheader:                          ; preds = %for.body14.lr.ph
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.preheader, %for.cond15.for.inc34_crit_edge.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond15.for.inc34_crit_edge.us ], [ 0, %for.body14.us.preheader ]
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us, %for.body14.us
  %indvars.iv57 = phi i64 [ 0, %for.body14.us ], [ %indvars.iv.next58, %for.body18.us ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %3 = mul nuw nsw i64 %indvars.iv.next58, %indvars.iv63
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22.us = srem i32 %5, 900
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, 4.500000e+03
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv63, i64 %indvars.iv57
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond62 = icmp eq i64 %indvars.iv.next58, 900
  br i1 %exitcond62, label %for.cond15.for.inc34_crit_edge.us, label %for.body18.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.body18.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 1000
  br i1 %exitcond66, label %for.end36.loopexit, label %for.body14.us

for.end36.loopexit:                               ; preds = %for.cond15.for.inc34_crit_edge.us
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %for.body.lr.ph, %for.end10
  br i1 true, label %for.body40.lr.ph, label %for.end61

for.body40.lr.ph:                                 ; preds = %for.end36
  br i1 true, label %for.body40.us.preheader, label %for.end87

for.body40.us.preheader:                          ; preds = %for.body40.lr.ph
  br label %for.body40.us

for.body40.us:                                    ; preds = %for.body40.us.preheader, %for.cond41.for.inc59_crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond41.for.inc59_crit_edge.us ], [ 0, %for.body40.us.preheader ]
  br label %for.body44.us

for.body44.us:                                    ; preds = %for.body44.us, %for.body40.us
  %indvars.iv46 = phi i64 [ 0, %for.body40.us ], [ %indvars.iv.next47, %for.body44.us ]
  %6 = add nuw nsw i64 %indvars.iv46, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv52
  %8 = trunc i64 %7 to i32
  %rem47.us = srem i32 %8, 1100
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, 5.500000e+03
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv52, i64 %indvars.iv46
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next47, 1200
  br i1 %exitcond51, label %for.cond41.for.inc59_crit_edge.us, label %for.body44.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.body44.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 900
  br i1 %exitcond55, label %for.end61.loopexit, label %for.body40.us

for.end61.loopexit:                               ; preds = %for.cond41.for.inc59_crit_edge.us
  br label %for.end61

for.end61:                                        ; preds = %for.end61.loopexit, %for.body14.lr.ph, %for.end36
  br i1 true, label %for.body65.lr.ph, label %for.end87

for.body65.lr.ph:                                 ; preds = %for.end61
  br i1 true, label %for.body65.us.preheader, label %for.end87

for.body65.us.preheader:                          ; preds = %for.body65.lr.ph
  br label %for.body65.us

for.body65.us:                                    ; preds = %for.body65.us.preheader, %for.cond66.for.inc85_crit_edge.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.cond66.for.inc85_crit_edge.us ], [ 0, %for.body65.us.preheader ]
  br label %for.body69.us

for.body69.us:                                    ; preds = %for.body69.us, %for.body65.us
  %indvars.iv = phi i64 [ 0, %for.body65.us ], [ %indvars.iv.next, %for.body69.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv41
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73.us = srem i32 %12, 1000
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, 5.000000e+03
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv41, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond66.for.inc85_crit_edge.us, label %for.body69.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.body69.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond44, label %for.end87.loopexit, label %for.body65.us

for.end87.loopexit:                               ; preds = %for.cond66.for.inc85_crit_edge.us
  br label %for.end87

for.end87:                                        ; preds = %for.end87.loopexit, %for.body40.lr.ph, %for.body65.lr.ph, %for.end61
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* %E, [1000 x double]* %A, [900 x double]* %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* %G) #0 {
entry:
  br i1 true, label %for.body.lr.ph, label %for.end26

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.body65.lr.ph

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc24_crit_edge.us, %for.body.us.preheader
  %indvars.iv195 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next196, %for.cond1.for.inc24_crit_edge.us ]
  br i1 true, label %for.body3.us.us.preheader, label %for.body3.us101.preheader

for.body3.us.us.preheader:                        ; preds = %for.body.us
  %arrayidx12.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv195, i64 0
  br label %for.body3.us.us

for.body3.us101.preheader:                        ; preds = %for.body.us
  %scevgep180 = getelementptr [900 x double], [900 x double]* %E, i64 %indvars.iv195, i64 0
  %scevgep180181 = bitcast double* %scevgep180 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep180181, i8 0, i64 7200, i32 8, i1 false)
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit, %for.body3.us101.preheader
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %exitcond198 = icmp eq i64 %indvars.iv.next196, 800
  br i1 %exitcond198, label %for.end26.loopexit, label %for.body.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv189 = phi i64 [ %indvars.iv.next190, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv195, i64 %indvars.iv189
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br i1 true, label %for.body8.us.us.prol.loopexit.unr-lcssa, label %for.body8.us.us.prol.preheader

for.body8.us.us.prol.preheader:                   ; preds = %for.body3.us.us
  %0 = load double, double* %arrayidx12.us.us.prol, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv189
  %1 = load double, double* %arrayidx16.us.us.prol, align 8
  %mul.us.us.prol = fmul double %0, %1
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx5.us.us, align 8
  br label %for.body8.us.us.prol.loopexit.unr-lcssa

for.body8.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body3.us.us, %for.body8.us.us.prol.preheader
  %indvars.iv182.unr.ph = phi i64 [ 1, %for.body8.us.us.prol.preheader ], [ 0, %for.body3.us.us ]
  %.unr188.ph = phi double [ %add.us.us.prol, %for.body8.us.us.prol.preheader ], [ 0.000000e+00, %for.body3.us.us ]
  br i1 false, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body8.us.us.preheader

for.body8.us.us.preheader:                        ; preds = %for.body8.us.us.prol.loopexit.unr-lcssa
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us.loopexit:     ; preds = %for.body8.us.us
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.cond6.for.inc21_crit_edge.us.us.loopexit, %for.body8.us.us.prol.loopexit.unr-lcssa
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next190, 900
  br i1 %exitcond192, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.body8.us.us.preheader, %for.body8.us.us
  %indvars.iv182 = phi i64 [ %indvars.iv.next183.1, %for.body8.us.us ], [ %indvars.iv182.unr.ph, %for.body8.us.us.preheader ]
  %2 = phi double [ %add.us.us.1, %for.body8.us.us ], [ %.unr188.ph, %for.body8.us.us.preheader ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv195, i64 %indvars.iv182
  %3 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv182, i64 %indvars.iv189
  %4 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %3, %4
  %add.us.us = fadd double %mul.us.us, %2
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv195, i64 %indvars.iv.next183
  %5 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next183, i64 %indvars.iv189
  %6 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %5, %6
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next183.1 = add nuw nsw i64 %indvars.iv182, 2
  %exitcond185.1 = icmp eq i64 %indvars.iv.next183.1, 1000
  br i1 %exitcond185.1, label %for.cond6.for.inc21_crit_edge.us.us.loopexit, label %for.body8.us.us

for.end26.loopexit:                               ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.end26

for.end26:                                        ; preds = %for.end26.loopexit, %entry
  br i1 true, label %for.body29.lr.ph, label %for.end62

for.body29.lr.ph:                                 ; preds = %for.end26
  br i1 true, label %for.body29.us.preheader, label %for.end62

for.body29.us.preheader:                          ; preds = %for.body29.lr.ph
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.cond30.for.inc60_crit_edge.us, %for.body29.us.preheader
  %indvars.iv171 = phi i64 [ 0, %for.body29.us.preheader ], [ %indvars.iv.next172, %for.cond30.for.inc60_crit_edge.us ]
  br i1 true, label %for.body32.us.us.preheader, label %for.body32.us57.preheader

for.body32.us.us.preheader:                       ; preds = %for.body29.us
  %arrayidx43.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv171, i64 0
  br label %for.body32.us.us

for.body32.us57.preheader:                        ; preds = %for.body29.us
  %scevgep156 = getelementptr [1100 x double], [1100 x double]* %F, i64 %indvars.iv171, i64 0
  %scevgep156157 = bitcast double* %scevgep156 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep156157, i8 0, i64 8800, i32 8, i1 false)
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us.loopexit:       ; preds = %for.cond37.for.inc57_crit_edge.us.us
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond30.for.inc60_crit_edge.us.loopexit, %for.body32.us57.preheader
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, 900
  br i1 %exitcond174, label %for.end62.loopexit, label %for.body29.us

for.body32.us.us:                                 ; preds = %for.body32.us.us.preheader, %for.cond37.for.inc57_crit_edge.us.us
  %indvars.iv165 = phi i64 [ %indvars.iv.next166, %for.cond37.for.inc57_crit_edge.us.us ], [ 0, %for.body32.us.us.preheader ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv171, i64 %indvars.iv165
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br i1 true, label %for.body39.us.us.prol.loopexit.unr-lcssa, label %for.body39.us.us.prol.preheader

for.body39.us.us.prol.preheader:                  ; preds = %for.body32.us.us
  %7 = load double, double* %arrayidx43.us.us.prol, align 8
  %arrayidx47.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 0, i64 %indvars.iv165
  %8 = load double, double* %arrayidx47.us.us.prol, align 8
  %mul48.us.us.prol = fmul double %7, %8
  %add53.us.us.prol = fadd double %mul48.us.us.prol, 0.000000e+00
  store double %add53.us.us.prol, double* %arrayidx36.us.us, align 8
  br label %for.body39.us.us.prol.loopexit.unr-lcssa

for.body39.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body32.us.us, %for.body39.us.us.prol.preheader
  %indvars.iv158.unr.ph = phi i64 [ 1, %for.body39.us.us.prol.preheader ], [ 0, %for.body32.us.us ]
  %.unr164.ph = phi double [ %add53.us.us.prol, %for.body39.us.us.prol.preheader ], [ 0.000000e+00, %for.body32.us.us ]
  br i1 false, label %for.cond37.for.inc57_crit_edge.us.us, label %for.body39.us.us.preheader

for.body39.us.us.preheader:                       ; preds = %for.body39.us.us.prol.loopexit.unr-lcssa
  br label %for.body39.us.us

for.cond37.for.inc57_crit_edge.us.us.loopexit:    ; preds = %for.body39.us.us
  br label %for.cond37.for.inc57_crit_edge.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.cond37.for.inc57_crit_edge.us.us.loopexit, %for.body39.us.us.prol.loopexit.unr-lcssa
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next166, 1100
  br i1 %exitcond168, label %for.cond30.for.inc60_crit_edge.us.loopexit, label %for.body32.us.us

for.body39.us.us:                                 ; preds = %for.body39.us.us.preheader, %for.body39.us.us
  %indvars.iv158 = phi i64 [ %indvars.iv.next159.1, %for.body39.us.us ], [ %indvars.iv158.unr.ph, %for.body39.us.us.preheader ]
  %9 = phi double [ %add53.us.us.1, %for.body39.us.us ], [ %.unr164.ph, %for.body39.us.us.preheader ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv171, i64 %indvars.iv158
  %10 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv158, i64 %indvars.iv165
  %11 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %10, %11
  %add53.us.us = fadd double %mul48.us.us, %9
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv171, i64 %indvars.iv.next159
  %12 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next159, i64 %indvars.iv165
  %13 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %12, %13
  %add53.us.us.1 = fadd double %mul48.us.us.1, %add53.us.us
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next159.1 = add nuw nsw i64 %indvars.iv158, 2
  %exitcond161.1 = icmp eq i64 %indvars.iv.next159.1, 1200
  br i1 %exitcond161.1, label %for.cond37.for.inc57_crit_edge.us.us.loopexit, label %for.body39.us.us

for.end62.loopexit:                               ; preds = %for.cond30.for.inc60_crit_edge.us
  br label %for.end62

for.end62:                                        ; preds = %for.end62.loopexit, %for.body29.lr.ph, %for.end26
  %cmp2849201 = phi i1 [ false, %for.end26 ], [ true, %for.body29.lr.ph ], [ true, %for.end62.loopexit ]
  br i1 true, label %for.body65.lr.ph, label %for.end98

for.body65.lr.ph:                                 ; preds = %for.body.lr.ph, %for.end62
  %cmp2849201202 = phi i1 [ %cmp2849201, %for.end62 ], [ false, %for.body.lr.ph ]
  br i1 true, label %for.body65.us.preheader, label %for.end98

for.body65.us.preheader:                          ; preds = %for.body65.lr.ph
  br label %for.body65.us

for.body65.us:                                    ; preds = %for.cond66.for.inc96_crit_edge.us, %for.body65.us.preheader
  %indvars.iv147 = phi i64 [ 0, %for.body65.us.preheader ], [ %indvars.iv.next148, %for.cond66.for.inc96_crit_edge.us ]
  br i1 %cmp2849201202, label %for.body68.us.us.preheader, label %for.body68.us13.preheader

for.body68.us.us.preheader:                       ; preds = %for.body65.us
  %arrayidx79.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv147, i64 0
  br label %for.body68.us.us

for.body68.us13.preheader:                        ; preds = %for.body65.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %G, i64 %indvars.iv147, i64 0
  %scevgep141 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep141, i8 0, i64 8800, i32 8, i1 false)
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us.loopexit:       ; preds = %for.cond73.for.inc93_crit_edge.us.us
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond66.for.inc96_crit_edge.us.loopexit, %for.body68.us13.preheader
  %indvars.iv.next148 = add nuw nsw i64 %indvars.iv147, 1
  %exitcond150 = icmp eq i64 %indvars.iv.next148, 800
  br i1 %exitcond150, label %for.end98.loopexit, label %for.body65.us

for.body68.us.us:                                 ; preds = %for.body68.us.us.preheader, %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %for.cond73.for.inc93_crit_edge.us.us ], [ 0, %for.body68.us.us.preheader ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv147, i64 %indvars.iv142
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br i1 true, label %for.body75.us.us.prol.loopexit.unr-lcssa, label %for.body75.us.us.prol.preheader

for.body75.us.us.prol.preheader:                  ; preds = %for.body68.us.us
  %14 = load double, double* %arrayidx79.us.us.prol, align 8
  %arrayidx83.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 0, i64 %indvars.iv142
  %15 = load double, double* %arrayidx83.us.us.prol, align 8
  %mul84.us.us.prol = fmul double %14, %15
  %add89.us.us.prol = fadd double %mul84.us.us.prol, 0.000000e+00
  store double %add89.us.us.prol, double* %arrayidx72.us.us, align 8
  br label %for.body75.us.us.prol.loopexit.unr-lcssa

for.body75.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body68.us.us, %for.body75.us.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body75.us.us.prol.preheader ], [ 0, %for.body68.us.us ]
  %.unr.ph = phi double [ %add89.us.us.prol, %for.body75.us.us.prol.preheader ], [ 0.000000e+00, %for.body68.us.us ]
  br i1 false, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body75.us.us.preheader

for.body75.us.us.preheader:                       ; preds = %for.body75.us.us.prol.loopexit.unr-lcssa
  br label %for.body75.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body75.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit, %for.body75.us.us.prol.loopexit.unr-lcssa
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %exitcond = icmp eq i64 %indvars.iv.next143, 1100
  br i1 %exitcond, label %for.cond66.for.inc96_crit_edge.us.loopexit, label %for.body68.us.us

for.body75.us.us:                                 ; preds = %for.body75.us.us.preheader, %for.body75.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body75.us.us ], [ %indvars.iv.unr.ph, %for.body75.us.us.preheader ]
  %16 = phi double [ %add89.us.us.1, %for.body75.us.us ], [ %.unr.ph, %for.body75.us.us.preheader ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv147, i64 %indvars.iv
  %17 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv142
  %18 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %17, %18
  %add89.us.us = fadd double %mul84.us.us, %16
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv147, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv142
  %20 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %19, %20
  %add89.us.us.1 = fadd double %mul84.us.us.1, %add89.us.us
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body75.us.us

for.end98.loopexit:                               ; preds = %for.cond66.for.inc96_crit_edge.us
  br label %for.end98

for.end98:                                        ; preds = %for.end98.loopexit, %for.body65.lr.ph, %for.end62
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1100 x double]* %G) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 800, %indvars.iv10
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond14, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

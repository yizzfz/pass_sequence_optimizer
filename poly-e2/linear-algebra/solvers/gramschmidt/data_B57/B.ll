; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.body3.lr.ph.us.preheader, label %for.end32

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.inc12.us, %for.body3.lr.ph.us.preheader
  %indvars.iv23 = phi i64 [ 0, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next24, %for.inc12.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv16 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next17, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv16, %indvars.iv23
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv16
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv23, i64 %indvars.iv16
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond, label %for.inc12.us, label %for.body3.us

for.inc12.us:                                     ; preds = %for.body3.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next24, 1000
  br i1 %exitcond30, label %for.cond15.preheader.loopexit, label %for.body3.lr.ph.us

for.cond15.preheader.loopexit:                    ; preds = %for.inc12.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  br i1 true, label %for.body22.lr.ph.us.preheader, label %for.end32

for.body22.lr.ph.us.preheader:                    ; preds = %for.cond15.preheader
  br i1 true, label %for.body22.lr.ph.us.prol.loopexit, label %for.body22.lr.ph.us.prol.preheader

for.body22.lr.ph.us.prol.preheader:               ; preds = %for.body22.lr.ph.us.preheader
  br label %for.body22.lr.ph.us.prol

for.body22.lr.ph.us.prol:                         ; preds = %for.body22.lr.ph.us.prol.preheader, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge
  br i1 true, label %for.body22.lr.ph.us.prol.loopexit.loopexit, label %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge, !llvm.loop !1

for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge: ; preds = %for.body22.lr.ph.us.prol
  br label %for.body22.lr.ph.us.prol

for.body22.lr.ph.us.prol.loopexit.loopexit:       ; preds = %for.body22.lr.ph.us.prol
  br label %for.body22.lr.ph.us.prol.loopexit

for.body22.lr.ph.us.prol.loopexit:                ; preds = %for.body22.lr.ph.us.prol.loopexit.loopexit, %for.body22.lr.ph.us.preheader
  br i1 false, label %for.end32, label %for.body22.lr.ph.us.preheader31

for.body22.lr.ph.us.preheader31:                  ; preds = %for.body22.lr.ph.us.prol.loopexit
  br i1 false, label %for.body22.lr.ph.us.prol.preheader32, label %for.body22.lr.ph.us.prol.loopexit33

for.body22.lr.ph.us.prol.preheader32:             ; preds = %for.body22.lr.ph.us.preheader31
  br label %for.body22.lr.ph.us.prol36

for.body22.lr.ph.us.prol36:                       ; preds = %for.body22.lr.ph.us.prol.preheader32
  br label %for.body22.lr.ph.us.prol.loopexit33

for.body22.lr.ph.us.prol.loopexit33:              ; preds = %for.body22.lr.ph.us.prol36, %for.body22.lr.ph.us.preheader31
  br i1 false, label %for.end32.loopexit, label %for.body22.lr.ph.us.preheader31.new

for.body22.lr.ph.us.preheader31.new:              ; preds = %for.body22.lr.ph.us.prol.loopexit33
  br label %for.body22.lr.ph.us

for.body22.lr.ph.us:                              ; preds = %for.body22.lr.ph.us, %for.body22.lr.ph.us.preheader31.new
  %indvars.iv12 = phi i64 [ 0, %for.body22.lr.ph.us.preheader31.new ], [ %indvars.iv.next13.3.1, %for.body22.lr.ph.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv12, i64 0
  %scevgep11 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next13 = or i64 %indvars.iv12, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13, i64 0
  %scevgep11.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next13.1 = or i64 %indvars.iv12, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.1, i64 0
  %scevgep11.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next13.2 = or i64 %indvars.iv12, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.2, i64 0
  %scevgep11.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next13.3 = or i64 %indvars.iv12, 4
  %scevgep.142 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.3, i64 0
  %scevgep11.143 = bitcast double* %scevgep.142 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.143, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next13.144 = or i64 %indvars.iv12, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.144, i64 0
  %scevgep11.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next13.1.1 = or i64 %indvars.iv12, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.1.1, i64 0
  %scevgep11.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next13.2.1 = or i64 %indvars.iv12, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.2.1, i64 0
  %scevgep11.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next13.3.1 = add nsw i64 %indvars.iv12, 8
  %exitcond15.3.1 = icmp eq i64 %indvars.iv.next13.3.1, 1200
  br i1 %exitcond15.3.1, label %for.end32.loopexit.unr-lcssa, label %for.body22.lr.ph.us

for.end32.loopexit.unr-lcssa:                     ; preds = %for.body22.lr.ph.us
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body22.lr.ph.us.prol.loopexit33, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.body22.lr.ph.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  br i1 true, label %for.cond1.preheader.preheader, label %for.end88

for.cond1.preheader.preheader:                    ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.preheader
  %indvars.iv73 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next74, %for.inc86.for.cond1.preheader_crit_edge ]
  %indvars.iv65 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next66, %for.inc86.for.cond1.preheader_crit_edge ]
  br i1 true, label %for.body3.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  br label %for.cond33.preheader

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 true, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol.for.body3.prol_crit_edge
  br i1 true, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol.for.body3.prol_crit_edge, !llvm.loop !3

for.body3.prol.for.body3.prol_crit_edge:          ; preds = %for.body3.prol
  br label %for.body3.prol

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  br i1 false, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ 0, %for.body3.preheader ]
  %nrm.03 = phi double [ %add.3, %for.body3 ], [ 0.000000e+00, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv73
  %0 = load double, double* %arrayidx5, align 8
  %mul = fmul double %0, %0
  %add = fadd double %nrm.03, %mul
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv73
  %1 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %1, %1
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv73
  %2 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %2, %2
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv73
  %3 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %3, %3
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit
  %nrm.0.lcssa = phi double [ undef, %for.body3.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv73, i64 %indvars.iv73
  store double %call, double* %arrayidx13, align 8
  br i1 true, label %for.body16.prol.loopexit.unr-lcssa, label %for.body16.prol.preheader

for.body16.prol.preheader:                        ; preds = %for.end
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.end, %for.body16.prol.preheader
  %indvars.iv46.unr.ph = phi i64 [ 1, %for.body16.prol.preheader ], [ 0, %for.end ]
  br i1 false, label %for.cond33.preheader, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.body16

for.cond33.preheader.loopexit:                    ; preds = %for.body16
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.body16.prol.loopexit.unr-lcssa, %for.end.thread
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %cmp3411 = icmp slt i64 %indvars.iv.next74, 1200
  br i1 %cmp3411, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 true, label %for.body42.lr.ph.us.preheader, label %for.body35.preheader

for.body42.lr.ph.us.preheader:                    ; preds = %for.body35.lr.ph
  br label %for.body42.lr.ph.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  br label %for.inc86

for.body42.lr.ph.us:                              ; preds = %for.cond33.loopexit.us, %for.body42.lr.ph.us.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv65, %for.body42.lr.ph.us.preheader ], [ %indvars.iv.next68, %for.cond33.loopexit.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv73, i64 %indvars.iv67
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 true, label %for.body42.us.prol.loopexit.unr-lcssa, label %for.body42.us.prol.preheader

for.body42.us.prol.preheader:                     ; preds = %for.body42.lr.ph.us
  br label %for.body42.us.prol.loopexit.unr-lcssa

for.body42.us.prol.loopexit.unr-lcssa:            ; preds = %for.body42.lr.ph.us, %for.body42.us.prol.preheader
  %indvars.iv57.unr.ph = phi i64 [ 1, %for.body42.us.prol.preheader ], [ 0, %for.body42.lr.ph.us ]
  br i1 false, label %for.body62.us.preheader, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit.unr-lcssa
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.1, %for.body42.us ], [ %indvars.iv57.unr.ph, %for.body42.us.preheader ]
  %4 = phi double [ %add56.us.1, %for.body42.us ], [ 0.000000e+00, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv57, i64 %indvars.iv73
  %5 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv67
  %6 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %5, %6
  %add56.us = fadd double %4, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next58, i64 %indvars.iv73
  %7 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next58, i64 %indvars.iv67
  %8 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %7, %8
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next58.1, 1000
  br i1 %exitcond60.1, label %for.body62.us.preheader.loopexit, label %for.body42.us

for.body62.us.preheader.loopexit:                 ; preds = %for.body42.us
  br label %for.body62.us.preheader

for.body62.us.preheader:                          ; preds = %for.body62.us.preheader.loopexit, %for.body42.us.prol.loopexit.unr-lcssa
  br i1 true, label %for.body62.us.prol.loopexit.unr-lcssa, label %for.body62.us.prol.preheader

for.body62.us.prol.preheader:                     ; preds = %for.body62.us.preheader
  br label %for.body62.us.prol.loopexit.unr-lcssa

for.body62.us.prol.loopexit.unr-lcssa:            ; preds = %for.body62.us.preheader, %for.body62.us.prol.preheader
  %indvars.iv61.unr.ph = phi i64 [ 1, %for.body62.us.prol.preheader ], [ 0, %for.body62.us.preheader ]
  br i1 false, label %for.cond33.loopexit.us, label %for.body62.us.preheader88

for.body62.us.preheader88:                        ; preds = %for.body62.us.prol.loopexit.unr-lcssa
  br label %for.body62.us

for.body62.us:                                    ; preds = %for.body62.us.preheader88, %for.body62.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %for.body62.us ], [ %indvars.iv61.unr.ph, %for.body62.us.preheader88 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv67
  %9 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv61, i64 %indvars.iv73
  %10 = load double, double* %arrayidx70.us, align 8
  %11 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %10, %11
  %sub.us = fsub double %9, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next62, i64 %indvars.iv67
  %12 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next62, i64 %indvars.iv73
  %13 = load double, double* %arrayidx70.us.1, align 8
  %14 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %13, %14
  %sub.us.1 = fsub double %12, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next62.1, 1000
  br i1 %exitcond64.1, label %for.cond33.loopexit.us.loopexit, label %for.body62.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.body62.us.prol.loopexit.unr-lcssa
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond = icmp eq i64 %indvars.iv.next68, 1200
  br i1 %exitcond, label %for.inc86.loopexit, label %for.body42.lr.ph.us

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %for.body16 ], [ %indvars.iv46.unr.ph, %for.body16.preheader ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv73
  %15 = load double, double* %arrayidx20, align 8
  %16 = load double, double* %arrayidx13, align 8
  %div = fdiv double %15, %16
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv46, i64 %indvars.iv73
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv73
  %17 = load double, double* %arrayidx20.1, align 8
  %18 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %17, %18
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next47, i64 %indvars.iv73
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next47.1 = add nuw nsw i64 %indvars.iv46, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, 1000
  br i1 %exitcond49.1, label %for.cond33.preheader.loopexit, label %for.body16

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.cond33.preheader, %for.body35.preheader
  %exitcond87 = icmp eq i64 %indvars.iv.next74, 1200
  br i1 %exitcond87, label %for.end88.loopexit, label %for.inc86.for.cond1.preheader_crit_edge

for.inc86.for.cond1.preheader_crit_edge:          ; preds = %for.inc86
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  br label %for.cond1.preheader

for.end88.loopexit:                               ; preds = %for.inc86
  br label %for.end88

for.end88:                                        ; preds = %for.end88.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %for.body4.lr.ph.us.preheader, label %for.end12

for.body4.lr.ph.us.preheader:                     ; preds = %entry
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.inc10.us, %for.body4.lr.ph.us.preheader
  %indvars.iv27 = phi i64 [ 0, %for.body4.lr.ph.us.preheader ], [ %indvars.iv.next28, %for.inc10.us ]
  %3 = mul nsw i64 %indvars.iv27, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body4.lr.ph.us
  %indvars.iv22 = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next23, %if.end.us ]
  %4 = add nsw i64 %indvars.iv22, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv27, i64 %indvars.iv22
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond33, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond31, label %for.end12.loopexit, label %for.body4.lr.ph.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br i1 false, label %for.end38, label %for.body20.lr.ph.us.preheader

for.body20.lr.ph.us.preheader:                    ; preds = %for.end12
  br label %for.body20.lr.ph.us

for.body20.lr.ph.us:                              ; preds = %for.inc36.us, %for.body20.lr.ph.us.preheader
  %indvars.iv16 = phi i64 [ 0, %for.body20.lr.ph.us.preheader ], [ %indvars.iv.next17, %for.inc36.us ]
  %11 = mul nsw i64 %indvars.iv16, 1200
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.body20.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body20.lr.ph.us ], [ %indvars.iv.next, %if.end27.us ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %rem23.us = srem i32 %13, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv16, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond32, label %for.inc36.us, label %for.body20.us

for.inc36.us:                                     ; preds = %if.end27.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond, label %for.end38.loopexit, label %for.body20.lr.ph.us

for.end38.loopexit:                               ; preds = %for.inc36.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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

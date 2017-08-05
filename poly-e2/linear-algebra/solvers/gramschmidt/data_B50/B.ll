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
  %cmp7 = icmp sgt i32 %m, 0
  br i1 %cmp7, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp25 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp25, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %n, -1
  %1 = sext i32 %m to i64
  %2 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc12.loopexit.us, %for.cond1.preheader.us.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next22, %for.inc12.loopexit.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.body3.us.for.body3.us_crit_edge ], [ 0, %for.cond1.preheader.us ]
  %3 = mul nuw nsw i64 %indvars.iv14, %indvars.iv21
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv14
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv21, i64 %indvars.iv14
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %exitcond25 = icmp eq i64 %indvars.iv14, %2
  br i1 %exitcond25, label %for.inc12.loopexit.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  br label %for.body3.us

for.inc12.loopexit.us:                            ; preds = %for.body3.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next22, %1
  br i1 %exitcond26, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.inc12.loopexit.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.cond19.preheader.us.preheader, label %for.end32

for.cond19.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %5 = add i32 %n, -1
  %6 = zext i32 %5 to i64
  %7 = shl nuw nsw i64 %6, 3
  %8 = add nuw nsw i64 %7, 8
  %9 = sext i32 %n to i64
  %10 = add nsw i64 %9, -1
  %xtraiter = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.us.prol.loopexit, label %for.cond19.preheader.us.prol.preheader

for.cond19.preheader.us.prol.preheader:           ; preds = %for.cond19.preheader.us.preheader
  br label %for.cond19.preheader.us.prol

for.cond19.preheader.us.prol:                     ; preds = %for.cond19.preheader.us.prol, %for.cond19.preheader.us.prol.preheader
  %indvars.iv12.prol = phi i64 [ 0, %for.cond19.preheader.us.prol.preheader ], [ %indvars.iv.next13.prol, %for.cond19.preheader.us.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.cond19.preheader.us.prol.preheader ], [ %prol.iter.sub, %for.cond19.preheader.us.prol ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv12.prol, i64 0
  %scevgep11.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.prol, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv12.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.unr-lcssa, label %for.cond19.preheader.us.prol, !llvm.loop !1

for.cond19.preheader.us.prol.loopexit.unr-lcssa:  ; preds = %for.cond19.preheader.us.prol
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.preheader.us.prol.loopexit:            ; preds = %for.cond19.preheader.us.preheader, %for.cond19.preheader.us.prol.loopexit.unr-lcssa
  %indvars.iv12.unr = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next13.prol, %for.cond19.preheader.us.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %10, 7
  br i1 %11, label %for.end32.loopexit, label %for.cond19.preheader.us.preheader.new

for.cond19.preheader.us.preheader.new:            ; preds = %for.cond19.preheader.us.prol.loopexit
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.preheader.us, %for.cond19.preheader.us.preheader.new
  %indvars.iv12 = phi i64 [ %indvars.iv12.unr, %for.cond19.preheader.us.preheader.new ], [ %indvars.iv.next13.7, %for.cond19.preheader.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv12, i64 0
  %scevgep11 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13, i64 0
  %scevgep11.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.1, i64 0
  %scevgep11.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13.2 = add nsw i64 %indvars.iv12, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.2, i64 0
  %scevgep11.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv12, 4
  %scevgep.4 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.3, i64 0
  %scevgep11.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.4, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13.4 = add nsw i64 %indvars.iv12, 5
  %scevgep.5 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.4, i64 0
  %scevgep11.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.5, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13.5 = add nsw i64 %indvars.iv12, 6
  %scevgep.6 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.5, i64 0
  %scevgep11.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.6, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13.6 = add nsw i64 %indvars.iv12, 7
  %scevgep.7 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next13.6, i64 0
  %scevgep11.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.7, i8 0, i64 %8, i32 8, i1 false)
  %indvars.iv.next13.7 = add nsw i64 %indvars.iv12, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next13.7, %9
  br i1 %exitcond.7, label %for.end32.loopexit.unr-lcssa, label %for.cond19.preheader.us

for.end32.loopexit.unr-lcssa:                     ; preds = %for.cond19.preheader.us
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.preheader.us.prol.loopexit, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp13 = icmp sgt i32 %n, 0
  br i1 %cmp13, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp21 = icmp sgt i32 %m, 0
  %0 = add i32 %m, -1
  %1 = add i32 %n, -2
  %2 = zext i32 %1 to i64
  %3 = sext i32 %n to i64
  %4 = zext i32 %0 to i64
  %5 = add nsw i64 %4, -1
  %exitcond81 = icmp eq i32 %0, 0
  %xtraiter = and i64 %4, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %6 = icmp eq i64 %5, 0
  %exitcond6487 = icmp eq i32 %0, 0
  %xtraiter89 = and i64 %4, 1
  %lcmp.mod90 = icmp eq i64 %xtraiter89, 0
  %7 = icmp eq i64 %5, 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.inc86.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc86.for.cond1.preheader_crit_edge ], [ 1, %for.cond1.preheader.lr.ph ]
  %8 = mul i64 %indvars.iv69, 1201
  %9 = add i64 %8, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %9
  %scevgep56 = bitcast double* %scevgep to i8*
  %10 = sub i64 %2, %indvars.iv69
  %11 = shl i64 %10, 3
  %12 = and i64 %11, 34359738360
  %13 = add nuw nsw i64 %12, 8
  br i1 %cmp21, label %for.body3.preheader, label %for.end.thread

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body3

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx1373 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv69, i64 %indvars.iv69
  store double 0.000000e+00, double* %arrayidx1373, align 8
  br label %for.cond33.preheader

for.body3:                                        ; preds = %for.body3.preheader, %for.body3.for.body3_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %nrm.03 = phi double [ %add, %for.body3.for.body3_crit_edge ], [ 0.000000e+00, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv69
  %14 = load double, double* %arrayidx5, align 8
  %mul = fmul double %14, %14
  %add = fadd double %nrm.03, %mul
  %exitcond75 = icmp eq i64 %indvars.iv, %4
  br i1 %exitcond75, label %for.end, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body3

for.end:                                          ; preds = %for.body3
  %call = tail call double @sqrt(double %add) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv69, i64 %indvars.iv69
  store double %call, double* %arrayidx13, align 8
  %arrayidx2078 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv69
  %15 = load double, double* %arrayidx2078, align 8
  %div79 = fdiv double %15, %call
  %arrayidx2880 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv69
  store double %div79, double* %arrayidx2880, align 8
  br i1 %exitcond81, label %for.cond33.preheader, label %for.body16.for.body16_crit_edge.preheader

for.body16.for.body16_crit_edge.preheader:        ; preds = %for.end
  br i1 %lcmp.mod, label %for.body16.for.body16_crit_edge.prol.loopexit.unr-lcssa, label %for.body16.for.body16_crit_edge.prol.preheader

for.body16.for.body16_crit_edge.prol.preheader:   ; preds = %for.body16.for.body16_crit_edge.preheader
  br label %for.body16.for.body16_crit_edge.prol

for.body16.for.body16_crit_edge.prol:             ; preds = %for.body16.for.body16_crit_edge.prol.preheader
  %.pre.prol = load double, double* %arrayidx13, align 8
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 1, i64 %indvars.iv69
  %16 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %16, %.pre.prol
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 1, i64 %indvars.iv69
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.for.body16_crit_edge.prol.loopexit.unr-lcssa

for.body16.for.body16_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body16.for.body16_crit_edge.preheader, %for.body16.for.body16_crit_edge.prol
  %indvars.iv4682.unr.ph = phi i64 [ 1, %for.body16.for.body16_crit_edge.prol ], [ 0, %for.body16.for.body16_crit_edge.preheader ]
  br label %for.body16.for.body16_crit_edge.prol.loopexit

for.body16.for.body16_crit_edge.prol.loopexit:    ; preds = %for.body16.for.body16_crit_edge.prol.loopexit.unr-lcssa
  br i1 %6, label %for.cond33.preheader.loopexit, label %for.body16.for.body16_crit_edge.preheader.new

for.body16.for.body16_crit_edge.preheader.new:    ; preds = %for.body16.for.body16_crit_edge.prol.loopexit
  br label %for.body16.for.body16_crit_edge

for.cond33.preheader.loopexit.unr-lcssa:          ; preds = %for.body16.for.body16_crit_edge
  br label %for.cond33.preheader.loopexit

for.cond33.preheader.loopexit:                    ; preds = %for.body16.for.body16_crit_edge.prol.loopexit, %for.cond33.preheader.loopexit.unr-lcssa
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.end, %for.end.thread
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %cmp3411 = icmp slt i64 %indvars.iv.next70, %3
  br i1 %cmp3411, label %for.body35.lr.ph, label %for.end88.loopexit

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 %cmp21, label %for.body35.us.preheader, label %for.inc86.thread

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx70.us84 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv69
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 1, i64 %indvars.iv69
  br label %for.body35.us

for.inc86.thread:                                 ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep56, i8 0, i64 %13, i32 8, i1 false)
  br label %for.inc86.for.cond1.preheader_crit_edge

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.cond33.loopexit.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.cond33.loopexit.us ], [ %indvars.iv65, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv69, i64 %indvars.iv67
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.for.body42.us_crit_edge, %for.body35.us
  %17 = phi double [ %add56.us, %for.body42.us.for.body42.us_crit_edge ], [ 0.000000e+00, %for.body35.us ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.body42.us.for.body42.us_crit_edge ], [ 0, %for.body35.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv57, i64 %indvars.iv69
  %18 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv67
  %19 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %18, %19
  %add56.us = fadd double %17, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %exitcond76 = icmp eq i64 %indvars.iv57, %4
  br i1 %exitcond76, label %for.body62.us.preheader, label %for.body42.us.for.body42.us_crit_edge

for.body42.us.for.body42.us_crit_edge:            ; preds = %for.body42.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br label %for.body42.us

for.body62.us.preheader:                          ; preds = %for.body42.us
  %arrayidx66.us83 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv67
  %20 = load double, double* %arrayidx66.us83, align 8
  %21 = load double, double* %arrayidx70.us84, align 8
  %mul75.us85 = fmul double %21, %add56.us
  %sub.us86 = fsub double %20, %mul75.us85
  store double %sub.us86, double* %arrayidx66.us83, align 8
  br i1 %exitcond6487, label %for.cond33.loopexit.us, label %for.body62.us.for.body62.us_crit_edge.preheader

for.body62.us.for.body62.us_crit_edge.preheader:  ; preds = %for.body62.us.preheader
  br i1 %lcmp.mod90, label %for.body62.us.for.body62.us_crit_edge.prol.loopexit.unr-lcssa, label %for.body62.us.for.body62.us_crit_edge.prol.preheader

for.body62.us.for.body62.us_crit_edge.prol.preheader: ; preds = %for.body62.us.for.body62.us_crit_edge.preheader
  br label %for.body62.us.for.body62.us_crit_edge.prol

for.body62.us.for.body62.us_crit_edge.prol:       ; preds = %for.body62.us.for.body62.us_crit_edge.prol.preheader
  %.pre71.prol = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 1, i64 %indvars.iv67
  %22 = load double, double* %arrayidx66.us.prol, align 8
  %23 = load double, double* %arrayidx70.us.prol, align 8
  %mul75.us.prol = fmul double %23, %.pre71.prol
  %sub.us.prol = fsub double %22, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.for.body62.us_crit_edge.prol.loopexit.unr-lcssa

for.body62.us.for.body62.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body62.us.for.body62.us_crit_edge.preheader, %for.body62.us.for.body62.us_crit_edge.prol
  %indvars.iv6188.unr.ph = phi i64 [ 1, %for.body62.us.for.body62.us_crit_edge.prol ], [ 0, %for.body62.us.for.body62.us_crit_edge.preheader ]
  br label %for.body62.us.for.body62.us_crit_edge.prol.loopexit

for.body62.us.for.body62.us_crit_edge.prol.loopexit: ; preds = %for.body62.us.for.body62.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %7, label %for.cond33.loopexit.us.loopexit, label %for.body62.us.for.body62.us_crit_edge.preheader.new

for.body62.us.for.body62.us_crit_edge.preheader.new: ; preds = %for.body62.us.for.body62.us_crit_edge.prol.loopexit
  br label %for.body62.us.for.body62.us_crit_edge

for.body62.us.for.body62.us_crit_edge:            ; preds = %for.body62.us.for.body62.us_crit_edge, %for.body62.us.for.body62.us_crit_edge.preheader.new
  %indvars.iv6188 = phi i64 [ %indvars.iv6188.unr.ph, %for.body62.us.for.body62.us_crit_edge.preheader.new ], [ %indvars.iv.next62.1, %for.body62.us.for.body62.us_crit_edge ]
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv6188, 1
  %.pre71 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next62, i64 %indvars.iv67
  %24 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next62, i64 %indvars.iv69
  %25 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %25, %.pre71
  %sub.us = fsub double %24, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv6188, 2
  %.pre71.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next62.1, i64 %indvars.iv67
  %26 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next62.1, i64 %indvars.iv69
  %27 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %27, %.pre71.1
  %sub.us.1 = fsub double %26, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %exitcond64.1 = icmp eq i64 %indvars.iv.next62.1, %4
  br i1 %exitcond64.1, label %for.cond33.loopexit.us.loopexit.unr-lcssa, label %for.body62.us.for.body62.us_crit_edge

for.cond33.loopexit.us.loopexit.unr-lcssa:        ; preds = %for.body62.us.for.body62.us_crit_edge
  br label %for.cond33.loopexit.us.loopexit

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us.for.body62.us_crit_edge.prol.loopexit, %for.cond33.loopexit.us.loopexit.unr-lcssa
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.body62.us.preheader
  %indvars.iv.next68 = add nsw i64 %indvars.iv67, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next68, %3
  br i1 %exitcond77, label %for.inc86.for.cond1.preheader_crit_edge.loopexit, label %for.body35.us

for.body16.for.body16_crit_edge:                  ; preds = %for.body16.for.body16_crit_edge, %for.body16.for.body16_crit_edge.preheader.new
  %indvars.iv4682 = phi i64 [ %indvars.iv4682.unr.ph, %for.body16.for.body16_crit_edge.preheader.new ], [ %indvars.iv.next47.1, %for.body16.for.body16_crit_edge ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4682, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv69
  %28 = load double, double* %arrayidx20, align 8
  %div = fdiv double %28, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next47, i64 %indvars.iv69
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv4682, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next47.1, i64 %indvars.iv69
  %29 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %29, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next47.1, i64 %indvars.iv69
  store double %div.1, double* %arrayidx28.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next47.1, %4
  br i1 %exitcond.1, label %for.cond33.preheader.loopexit.unr-lcssa, label %for.body16.for.body16_crit_edge

for.inc86.for.cond1.preheader_crit_edge.loopexit: ; preds = %for.cond33.loopexit.us
  br label %for.inc86.for.cond1.preheader_crit_edge

for.inc86.for.cond1.preheader_crit_edge:          ; preds = %for.inc86.for.cond1.preheader_crit_edge.loopexit, %for.inc86.thread
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  br label %for.cond1.preheader

for.end88.loopexit:                               ; preds = %for.cond33.preheader
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
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.loopexit.us, %for.cond2.preheader.us.preheader
  %indvars.iv19 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next20, %for.inc10.loopexit.us ]
  %4 = mul nsw i64 %indvars.iv19, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv16 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next17, %if.end.us ]
  %5 = add nsw i64 %indvars.iv16, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv19, i64 %indvars.iv16
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #7
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next17, %3
  br i1 %exitcond23, label %for.inc10.loopexit.us, label %for.body4.us

for.inc10.loopexit.us:                            ; preds = %if.end.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next20, %3
  br i1 %exitcond24, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.loopexit.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %cmp163.not = icmp slt i32 %m, 1
  %cmp8.not = xor i1 %cmp8, true
  %brmerge = or i1 %cmp163.not, %cmp8.not
  br i1 %brmerge, label %for.end38, label %for.cond18.preheader.us.preheader

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %12 = sext i32 %n to i64
  %13 = sext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.inc36.loopexit.us, %for.cond18.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next14, %for.inc36.loopexit.us ]
  %14 = mul nsw i64 %indvars.iv13, %12
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %if.end27.us ]
  %15 = add nsw i64 %indvars.iv, %14
  %16 = trunc i64 %15 to i32
  %rem23.us = srem i32 %16, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv13, i64 %indvars.iv
  %19 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %12
  br i1 %exitcond, label %for.inc36.loopexit.us, label %for.body20.us

for.inc36.loopexit.us:                            ; preds = %if.end27.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next14, %13
  br i1 %exitcond22, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.inc36.loopexit.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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

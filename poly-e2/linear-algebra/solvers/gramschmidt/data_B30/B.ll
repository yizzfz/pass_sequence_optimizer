; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) #2 {
entry:
  %cmp7 = icmp sgt i32 %m, 0
  br i1 %cmp7, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp25 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp25, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %n to i64
  %1 = zext i32 %m to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next19, %for.cond1.for.inc12_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next13, %for.inc.us ]
  %2 = mul nuw nsw i64 %indvars.iv12, %indvars.iv18
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv12
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv18, i64 %indvars.iv12
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next13, %0
  br i1 %exitcond24, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %1
  br i1 %exitcond, label %for.cond15.preheader.loopexit, label %for.cond1.preheader.us

for.cond15.preheader.loopexit:                    ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.cond19.preheader.us.preheader, label %for.end32

for.cond19.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %4 = add i32 %n, -1
  %5 = zext i32 %4 to i64
  %6 = shl nuw nsw i64 %5, 3
  %7 = add nuw nsw i64 %6, 8
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond19.preheader.us.prol.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.preheader

for.cond19.for.inc30_crit_edge.us.prol.preheader: ; preds = %for.cond19.preheader.us.preheader
  %8 = add nsw i32 %xtraiter, -1
  %9 = zext i32 %8 to i64
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.for.inc30_crit_edge.us.prol:           ; preds = %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge, %for.cond19.for.inc30_crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ 0, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge ], [ %xtraiter, %for.cond19.for.inc30_crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.prol, i64 0
  %scevgep11.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.prol, i8 0, i64 %7, i32 8, i1 false)
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond19.preheader.us.prol.loopexit.loopexit, label %for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge, !llvm.loop !1

for.cond19.for.inc30_crit_edge.us.prol.for.cond19.for.inc30_crit_edge.us.prol_crit_edge: ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.cond19.for.inc30_crit_edge.us.prol

for.cond19.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond19.for.inc30_crit_edge.us.prol
  %10 = add nuw nsw i64 %9, 1
  br label %for.cond19.preheader.us.prol.loopexit

for.cond19.preheader.us.prol.loopexit:            ; preds = %for.cond19.preheader.us.preheader, %for.cond19.preheader.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ %10, %for.cond19.preheader.us.prol.loopexit.loopexit ], [ 0, %for.cond19.preheader.us.preheader ]
  %11 = icmp ult i32 %4, 3
  br i1 %11, label %for.end32, label %for.cond19.for.inc30_crit_edge.us.3.preheader

for.cond19.for.inc30_crit_edge.us.3.preheader:    ; preds = %for.cond19.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %n to i64
  %12 = add nsw i64 %wide.trip.count.3, -4
  %13 = sub nsw i64 %12, %indvars.iv.unr
  %14 = lshr i64 %13, 2
  %15 = and i64 %14, 1
  %lcmp.mod26 = icmp eq i64 %15, 0
  br i1 %lcmp.mod26, label %for.cond19.for.inc30_crit_edge.us.3.prol.preheader, label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.preheader: ; preds = %for.cond19.for.inc30_crit_edge.us.3.preheader
  br label %for.cond19.for.inc30_crit_edge.us.3.prol

for.cond19.for.inc30_crit_edge.us.3.prol:         ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.preheader
  %scevgep.prol28 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.unr, i64 0
  %scevgep11.prol29 = bitcast double* %scevgep.prol28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.prol29, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.prol30 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.prol30, i64 0
  %scevgep11.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep11.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep11.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3.prol, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit

for.cond19.for.inc30_crit_edge.us.3.prol.loopexit: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol, %for.cond19.for.inc30_crit_edge.us.3.preheader
  %indvars.iv.unr31 = phi i64 [ %indvars.iv.unr, %for.cond19.for.inc30_crit_edge.us.3.preheader ], [ %indvars.iv.next.3.prol, %for.cond19.for.inc30_crit_edge.us.3.prol ]
  %16 = icmp eq i64 %14, 0
  br i1 %16, label %for.end32.loopexit, label %for.cond19.for.inc30_crit_edge.us.3.preheader.new

for.cond19.for.inc30_crit_edge.us.3.preheader.new: ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit
  br label %for.cond19.for.inc30_crit_edge.us.3

for.end32.loopexit.unr-lcssa:                     ; preds = %for.cond19.for.inc30_crit_edge.us.3
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.cond19.for.inc30_crit_edge.us.3.prol.loopexit, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.cond19.preheader.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void

for.cond19.for.inc30_crit_edge.us.3:              ; preds = %for.cond19.for.inc30_crit_edge.us.3, %for.cond19.for.inc30_crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr31, %for.cond19.for.inc30_crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %for.cond19.for.inc30_crit_edge.us.3 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep11 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep11.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep11.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep11.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.132 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep11.133 = bitcast double* %scevgep.132 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.133, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.134 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.134, i64 0
  %scevgep11.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.1.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.1, i64 0
  %scevgep11.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.2.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.1, i64 0
  %scevgep11.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep11.3.1, i8 0, i64 %7, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %for.end32.loopexit.unr-lcssa, label %for.cond19.for.inc30_crit_edge.us.3
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) #0 {
entry:
  %cmp42 = icmp sgt i32 %n, 0
  br i1 %cmp42, label %for.cond1.preheader.lr.ph, label %for.end88

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp21 = icmp sgt i32 %m, 0
  %0 = add i32 %m, -1
  %1 = add i32 %n, -2
  %2 = zext i32 %1 to i64
  %3 = sext i32 %n to i64
  %4 = and i32 %m, 3
  %5 = add nsw i32 %4, -1
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, 1
  %8 = zext i32 %n to i64
  %lcmp.mod = icmp eq i32 %4, 0
  %9 = icmp ult i32 %0, 3
  %wide.trip.count.3 = zext i32 %m to i64
  %xtraiter48 = and i32 %m, 1
  %lcmp.mod49 = icmp eq i32 %xtraiter48, 0
  %10 = icmp eq i32 %0, 0
  br label %for.cond1.preheader

for.cond.loopexit.loopexit44:                     ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep56, i8 0, i64 %16, i32 8, i1 false)
  br label %for.cond.loopexit

for.cond.loopexit.loopexit:                       ; preds = %for.inc83.us
  br label %for.cond.loopexit

for.cond.loopexit:                                ; preds = %for.cond.loopexit.loopexit, %for.end31, %for.cond.loopexit.loopexit44
  %exitcond = icmp eq i64 %indvars.iv.next79, %8
  br i1 %exitcond, label %for.end88.loopexit, label %for.cond.loopexit.for.cond1.preheader_crit_edge

for.cond.loopexit.for.cond1.preheader_crit_edge:  ; preds = %for.cond.loopexit
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.loopexit.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv78 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next79, %for.cond.loopexit.for.cond1.preheader_crit_edge ]
  %indvars.iv71 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next72, %for.cond.loopexit.for.cond1.preheader_crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv78, 1201
  %12 = add nuw nsw i64 %11, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %12
  %scevgep56 = bitcast double* %scevgep to i8*
  %13 = sub i64 %2, %indvars.iv78
  %14 = shl i64 %13, 3
  %15 = and i64 %14, 34359738360
  %16 = add nuw nsw i64 %15, 8
  br i1 %cmp21, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol.for.inc.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %for.inc.prol.preheader ]
  %nrm.03.prol = phi double [ %add.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ %4, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv78
  %17 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %17, %17
  %add.prol = fadd double %nrm.03.prol, %mul.prol
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !3

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc.prol

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %7, %for.inc.prol.loopexit.loopexit ]
  %nrm.03.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  br i1 %9, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %nrm.03 = phi double [ %add.3, %for.inc ], [ %nrm.03.unr, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv78
  %18 = load double, double* %arrayidx5, align 8
  %mul = fmul double %18, %18
  %add = fadd double %nrm.03, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv78
  %19 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %19, %19
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv78
  %20 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %20, %20
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv78
  %21 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %21, %21
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.cond1.preheader
  %nrm.0.lcssa = phi double [ 0.000000e+00, %for.cond1.preheader ], [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv78, i64 %indvars.iv78
  store double %call, double* %arrayidx13, align 8
  br i1 %cmp21, label %for.inc29.preheader, label %for.end31

for.inc29.preheader:                              ; preds = %for.end
  br i1 %lcmp.mod49, label %for.inc29.prol.loopexit, label %for.inc29.prol

for.inc29.prol:                                   ; preds = %for.inc29.preheader
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv78
  %22 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %22, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv78
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.inc29.prol.loopexit

for.inc29.prol.loopexit:                          ; preds = %for.inc29.preheader, %for.inc29.prol
  %indvars.iv45.unr.ph = phi i64 [ 1, %for.inc29.prol ], [ 0, %for.inc29.preheader ]
  br i1 %10, label %for.end31, label %for.inc29.preheader88

for.inc29.preheader88:                            ; preds = %for.inc29.prol.loopexit
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.preheader88, %for.inc29
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %for.inc29 ], [ %indvars.iv45.unr.ph, %for.inc29.preheader88 ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv78
  %23 = load double, double* %arrayidx20, align 8
  %24 = load double, double* %arrayidx13, align 8
  %div = fdiv double %23, %24
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv45, i64 %indvars.iv78
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next46, i64 %indvars.iv78
  %25 = load double, double* %arrayidx20.1, align 8
  %26 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %25, %26
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next46, i64 %indvars.iv78
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next46.1 = add nuw nsw i64 %indvars.iv45, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next46.1, %wide.trip.count.3
  br i1 %exitcond.1, label %for.end31.loopexit, label %for.inc29

for.end31.loopexit:                               ; preds = %for.inc29
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit, %for.inc29.prol.loopexit, %for.end
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %cmp3410 = icmp slt i64 %indvars.iv.next79, %3
  br i1 %cmp3410, label %for.body35.lr.ph, label %for.cond.loopexit

for.body35.lr.ph:                                 ; preds = %for.end31
  br i1 %cmp21, label %for.body35.us.preheader, label %for.cond.loopexit.loopexit44

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv78
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.inc83.us, %for.body35.us.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv71, %for.body35.us.preheader ], [ %indvars.iv.next74, %for.inc83.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv78, i64 %indvars.iv73
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod49, label %for.inc57.us.prol.loopexit, label %for.inc57.us.prol

for.inc57.us.prol:                                ; preds = %for.body35.us
  %27 = load double, double* %arrayidx70.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv73
  %28 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %27, %28
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.inc57.us.prol.loopexit

for.inc57.us.prol.loopexit:                       ; preds = %for.body35.us, %for.inc57.us.prol
  %29 = phi double [ %add56.us.prol, %for.inc57.us.prol ], [ 0.000000e+00, %for.body35.us ]
  %indvars.iv57.unr.ph = phi i64 [ 1, %for.inc57.us.prol ], [ 0, %for.body35.us ]
  br i1 %10, label %for.inc80.us.preheader, label %for.inc57.us.preheader

for.inc57.us.preheader:                           ; preds = %for.inc57.us.prol.loopexit
  br label %for.inc57.us

for.inc83.us.loopexit:                            ; preds = %for.inc80.us
  br label %for.inc83.us

for.inc83.us:                                     ; preds = %for.inc83.us.loopexit, %for.inc80.us.prol.loopexit
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next74, %8
  br i1 %exitcond84, label %for.cond.loopexit.loopexit, label %for.body35.us

for.inc80.us:                                     ; preds = %for.inc80.us.preheader87, %for.inc80.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65.1, %for.inc80.us ], [ %indvars.iv64.unr.ph, %for.inc80.us.preheader87 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv73
  %30 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv64, i64 %indvars.iv78
  %31 = load double, double* %arrayidx70.us, align 8
  %32 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %31, %32
  %sub.us = fsub double %30, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next65, i64 %indvars.iv73
  %33 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next65, i64 %indvars.iv78
  %34 = load double, double* %arrayidx70.us.1, align 8
  %35 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %34, %35
  %sub.us.1 = fsub double %33, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next65.1 = add nuw nsw i64 %indvars.iv64, 2
  %exitcond.170 = icmp eq i64 %indvars.iv.next65.1, %wide.trip.count.3
  br i1 %exitcond.170, label %for.inc83.us.loopexit, label %for.inc80.us

for.inc57.us:                                     ; preds = %for.inc57.us.preheader, %for.inc57.us
  %36 = phi double [ %add56.us.1, %for.inc57.us ], [ %29, %for.inc57.us.preheader ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.1, %for.inc57.us ], [ %indvars.iv57.unr.ph, %for.inc57.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv57, i64 %indvars.iv78
  %37 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv73
  %38 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %37, %38
  %add56.us = fadd double %36, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next58, i64 %indvars.iv78
  %39 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next58, i64 %indvars.iv73
  %40 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %39, %40
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %exitcond.163 = icmp eq i64 %indvars.iv.next58.1, %wide.trip.count.3
  br i1 %exitcond.163, label %for.inc80.us.preheader.loopexit, label %for.inc57.us

for.inc80.us.preheader.loopexit:                  ; preds = %for.inc57.us
  br label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc80.us.preheader.loopexit, %for.inc57.us.prol.loopexit
  %41 = phi double [ %29, %for.inc57.us.prol.loopexit ], [ %add56.us.1, %for.inc80.us.preheader.loopexit ]
  br i1 %lcmp.mod49, label %for.inc80.us.prol.loopexit, label %for.inc80.us.prol

for.inc80.us.prol:                                ; preds = %for.inc80.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv73
  %42 = load double, double* %arrayidx66.us.prol, align 8
  %43 = load double, double* %arrayidx70.us.prol, align 8
  %mul75.us.prol = fmul double %43, %41
  %sub.us.prol = fsub double %42, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.inc80.us.prol.loopexit

for.inc80.us.prol.loopexit:                       ; preds = %for.inc80.us.preheader, %for.inc80.us.prol
  %indvars.iv64.unr.ph = phi i64 [ 1, %for.inc80.us.prol ], [ 0, %for.inc80.us.preheader ]
  br i1 %10, label %for.inc83.us, label %for.inc80.us.preheader87

for.inc80.us.preheader87:                         ; preds = %for.inc80.us.prol.loopexit
  br label %for.inc80.us

for.end88.loopexit:                               ; preds = %for.cond.loopexit
  br label %for.end88

for.end88:                                        ; preds = %for.end88.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %R, [1200 x double]* nocapture readonly %Q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv14, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next10, %for.inc.us ]
  %6 = add nsw i64 %indvars.iv9, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv14, i64 %indvars.iv9
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next10, %4
  br i1 %exitcond20, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next15, %4
  br i1 %exitcond21, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %cmp166 = icmp sgt i32 %m, 0
  %or.cond = and i1 %cmp166, %cmp10
  br i1 %or.cond, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.end12
  %13 = sext i32 %n to i64
  %14 = zext i32 %n to i64
  %15 = zext i32 %m to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %for.cond18.preheader.us.preheader ], [ %indvars.iv.next4, %for.cond18.for.inc36_crit_edge.us ]
  %16 = mul nsw i64 %indvars.iv3, %13
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.cond18.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next, %for.inc33.us ]
  %17 = add nsw i64 %indvars.iv, %16
  %18 = trunc i64 %17 to i32
  %rem23.us = srem i32 %18, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %for.inc33.us

if.then25.us:                                     ; preds = %for.body20.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.body20.us, %if.then25.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv3, i64 %indvars.iv
  %21 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, %14
  br i1 %exitcond19, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.inc33.us
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, %15
  br i1 %exitcond, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

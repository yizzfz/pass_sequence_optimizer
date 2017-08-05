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
  br i1 %cmp25, label %for.inc.lr.ph.us.preheader, label %for.end32

for.inc.lr.ph.us.preheader:                       ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %n to i64
  %1 = zext i32 %m to i64
  br label %for.inc.lr.ph.us

for.inc.lr.ph.us:                                 ; preds = %for.inc12.us, %for.inc.lr.ph.us.preheader
  %indvars.iv20 = phi i64 [ 0, %for.inc.lr.ph.us.preheader ], [ %indvars.iv.next21, %for.inc12.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.lr.ph.us
  %indvars.iv15 = phi i64 [ 0, %for.inc.lr.ph.us ], [ %indvars.iv.next16, %for.inc.us ]
  %2 = mul nuw nsw i64 %indvars.iv15, %indvars.iv20
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv15
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv20, i64 %indvars.iv15
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %0
  br i1 %exitcond, label %for.inc12.us, label %for.inc.us

for.inc12.us:                                     ; preds = %for.inc.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next21, %1
  br i1 %exitcond30, label %for.cond15.preheader.loopexit, label %for.inc.lr.ph.us

for.cond15.preheader.loopexit:                    ; preds = %for.inc12.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.inc27.lr.ph.us.preheader, label %for.end32

for.inc27.lr.ph.us.preheader:                     ; preds = %for.cond15.preheader
  %4 = zext i32 %n to i64
  %5 = shl nuw nsw i64 %4, 3
  %6 = add nsw i64 %4, -1
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc27.lr.ph.us.prol.loopexit, label %for.inc27.lr.ph.us.prol.preheader

for.inc27.lr.ph.us.prol.preheader:                ; preds = %for.inc27.lr.ph.us.preheader
  br label %for.inc27.lr.ph.us.prol

for.inc27.lr.ph.us.prol:                          ; preds = %for.inc27.lr.ph.us.prol.preheader, %for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next12.prol, %for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge ], [ 0, %for.inc27.lr.ph.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge ], [ %xtraiter, %for.inc27.lr.ph.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv11.prol, i64 0
  %scevgep25.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.prol, i8 0, i64 %5, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc27.lr.ph.us.prol.loopexit.loopexit, label %for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge, !llvm.loop !1

for.inc27.lr.ph.us.prol.for.inc27.lr.ph.us.prol_crit_edge: ; preds = %for.inc27.lr.ph.us.prol
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  br label %for.inc27.lr.ph.us.prol

for.inc27.lr.ph.us.prol.loopexit.loopexit:        ; preds = %for.inc27.lr.ph.us.prol
  br label %for.inc27.lr.ph.us.prol.loopexit

for.inc27.lr.ph.us.prol.loopexit:                 ; preds = %for.inc27.lr.ph.us.prol.loopexit.loopexit, %for.inc27.lr.ph.us.preheader
  %indvars.iv11.unr = phi i64 [ 0, %for.inc27.lr.ph.us.preheader ], [ %xtraiter, %for.inc27.lr.ph.us.prol.loopexit.loopexit ]
  %7 = icmp ult i64 %6, 3
  br i1 %7, label %for.end32, label %for.inc27.lr.ph.us.preheader31

for.inc27.lr.ph.us.preheader31:                   ; preds = %for.inc27.lr.ph.us.prol.loopexit
  %8 = add nsw i64 %4, -4
  %9 = sub nsw i64 %8, %indvars.iv11.unr
  %10 = lshr i64 %9, 2
  %11 = and i64 %10, 1
  %lcmp.mod35 = icmp eq i64 %11, 0
  br i1 %lcmp.mod35, label %for.inc27.lr.ph.us.prol.preheader32, label %for.inc27.lr.ph.us.prol.loopexit33

for.inc27.lr.ph.us.prol.preheader32:              ; preds = %for.inc27.lr.ph.us.preheader31
  br label %for.inc27.lr.ph.us.prol36

for.inc27.lr.ph.us.prol36:                        ; preds = %for.inc27.lr.ph.us.prol.preheader32
  %scevgep.prol38 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv11.unr, i64 0
  %scevgep25.prol39 = bitcast double* %scevgep.prol38 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.prol39, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.prol40 = add nuw nsw i64 %indvars.iv11.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.prol40, i64 0
  %scevgep25.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.1.prol = add nuw nsw i64 %indvars.iv11.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.1.prol, i64 0
  %scevgep25.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.2.prol = add nuw nsw i64 %indvars.iv11.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.2.prol, i64 0
  %scevgep25.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.prol, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.3.prol = or i64 %indvars.iv11.unr, 4
  br label %for.inc27.lr.ph.us.prol.loopexit33

for.inc27.lr.ph.us.prol.loopexit33:               ; preds = %for.inc27.lr.ph.us.prol36, %for.inc27.lr.ph.us.preheader31
  %indvars.iv11.unr41 = phi i64 [ %indvars.iv11.unr, %for.inc27.lr.ph.us.preheader31 ], [ %indvars.iv.next12.3.prol, %for.inc27.lr.ph.us.prol36 ]
  %12 = icmp eq i64 %10, 0
  br i1 %12, label %for.end32.loopexit, label %for.inc27.lr.ph.us.preheader31.new

for.inc27.lr.ph.us.preheader31.new:               ; preds = %for.inc27.lr.ph.us.prol.loopexit33
  br label %for.inc27.lr.ph.us

for.inc27.lr.ph.us:                               ; preds = %for.inc27.lr.ph.us, %for.inc27.lr.ph.us.preheader31.new
  %indvars.iv11 = phi i64 [ %indvars.iv11.unr41, %for.inc27.lr.ph.us.preheader31.new ], [ %indvars.iv.next12.3.1, %for.inc27.lr.ph.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv11, i64 0
  %scevgep25 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12, i64 0
  %scevgep25.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.1, i64 0
  %scevgep25.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv11, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.2, i64 0
  %scevgep25.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv11, 4
  %scevgep.142 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.3, i64 0
  %scevgep25.143 = bitcast double* %scevgep.142 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.143, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.144 = add nsw i64 %indvars.iv11, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.144, i64 0
  %scevgep25.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.1.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.1.1 = add nsw i64 %indvars.iv11, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.1.1, i64 0
  %scevgep25.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.2.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.2.1 = add nsw i64 %indvars.iv11, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next12.2.1, i64 0
  %scevgep25.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep25.3.1, i8 0, i64 %5, i32 8, i1 false)
  %indvars.iv.next12.3.1 = add nsw i64 %indvars.iv11, 8
  %exitcond14.3.1 = icmp eq i64 %indvars.iv.next12.3.1, %4
  br i1 %exitcond14.3.1, label %for.end32.loopexit.unr-lcssa, label %for.inc27.lr.ph.us

for.end32.loopexit.unr-lcssa:                     ; preds = %for.inc27.lr.ph.us
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.inc27.lr.ph.us.prol.loopexit33, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.inc27.lr.ph.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* nocapture %A, [1200 x double]* nocapture %R, [1200 x double]* nocapture %Q) unnamed_addr #0 {
entry:
  %cmp12 = icmp sgt i32 %n, 0
  br i1 %cmp12, label %for.cond1.preheader.preheader, label %for.end88

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = sext i32 %n to i64
  %1 = zext i32 %n to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nsw i64 %2, -8
  %4 = zext i32 %m to i64
  %5 = add nsw i64 %4, -1
  %6 = icmp sgt i32 %m, 0
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i64 %5, 3
  %xtraiter76 = and i64 %4, 1
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  %8 = icmp eq i64 %5, 0
  %lcmp.mod79 = icmp ne i64 %xtraiter76, 0
  br label %for.cond1.preheader

for.cond.loopexit.loopexit:                       ; preds = %for.inc83.us
  br label %for.cond.loopexit

for.cond.loopexit:                                ; preds = %for.cond.loopexit.loopexit, %for.end31, %for.body35.preheader
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %1
  br i1 %exitcond72, label %for.end88.loopexit, label %for.cond.loopexit.for.cond1.preheader_crit_edge

for.cond.loopexit.for.cond1.preheader_crit_edge:  ; preds = %for.cond.loopexit
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.loopexit.for.cond1.preheader_crit_edge, %for.cond1.preheader.preheader
  %indvars.iv69 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next70, %for.cond.loopexit.for.cond1.preheader_crit_edge ]
  %indvars.iv63 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next64, %for.cond.loopexit.for.cond1.preheader_crit_edge ]
  %9 = mul i64 %indvars.iv69, 1201
  %10 = add i64 %9, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %10
  %scevgep73 = bitcast double* %scevgep to i8*
  %11 = mul i64 %indvars.iv69, -8
  %12 = add i64 %3, %11
  br i1 %6, label %for.inc.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx1383 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv69, i64 %indvars.iv69
  store double 0.000000e+00, double* %arrayidx1383, align 8
  br label %for.end31

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol.for.inc.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %for.inc.prol.preheader ]
  %nrm.03.prol = phi double [ %add.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0.000000e+00, %for.inc.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ %xtraiter, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv69
  %13 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %13, %13
  %add.prol = fadd double %nrm.03.prol, %mul.prol
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !3

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc.prol

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %xtraiter, %for.inc.prol.loopexit.loopexit ]
  %nrm.03.unr = phi double [ 0.000000e+00, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.inc.lr.ph ], [ %add.prol, %for.inc.prol.loopexit.loopexit ]
  br i1 %7, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ %indvars.iv.unr, %for.inc.preheader ]
  %nrm.03 = phi double [ %add.3, %for.inc ], [ %nrm.03.unr, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv69
  %14 = load double, double* %arrayidx5, align 8
  %mul = fmul double %14, %14
  %add = fadd double %nrm.03, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv69
  %15 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %15, %15
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv69
  %16 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %16, %16
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv69
  %17 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %17, %17
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %4
  br i1 %exitcond.3, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit
  %nrm.0.lcssa = phi double [ %add.lcssa.unr, %for.inc.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %nrm.0.lcssa) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv69, i64 %indvars.iv69
  store double %call, double* %arrayidx13, align 8
  br i1 %lcmp.mod77, label %for.inc29.prol.loopexit.unr-lcssa, label %for.inc29.prol.preheader

for.inc29.prol.preheader:                         ; preds = %for.end
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv69
  %18 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %18, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv69
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.inc29.prol.loopexit.unr-lcssa

for.inc29.prol.loopexit.unr-lcssa:                ; preds = %for.end, %for.inc29.prol.preheader
  %indvars.iv45.unr.ph = phi i64 [ 1, %for.inc29.prol.preheader ], [ 0, %for.end ]
  br i1 %8, label %for.end31, label %for.inc29.preheader

for.inc29.preheader:                              ; preds = %for.inc29.prol.loopexit.unr-lcssa
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.preheader, %for.inc29
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %for.inc29 ], [ %indvars.iv45.unr.ph, %for.inc29.preheader ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv69
  %19 = load double, double* %arrayidx20, align 8
  %20 = load double, double* %arrayidx13, align 8
  %div = fdiv double %19, %20
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv45, i64 %indvars.iv69
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next46, i64 %indvars.iv69
  %21 = load double, double* %arrayidx20.1, align 8
  %22 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %21, %22
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next46, i64 %indvars.iv69
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next46.1 = add nuw nsw i64 %indvars.iv45, 2
  %exitcond48.1 = icmp eq i64 %indvars.iv.next46.1, %4
  br i1 %exitcond48.1, label %for.end31.loopexit, label %for.inc29

for.end31.loopexit:                               ; preds = %for.inc29
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit, %for.inc29.prol.loopexit.unr-lcssa, %for.end.thread
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %cmp3410 = icmp slt i64 %indvars.iv.next70, %0
  br i1 %cmp3410, label %for.body35.lr.ph, label %for.cond.loopexit

for.body35.lr.ph:                                 ; preds = %for.end31
  br i1 %6, label %for.inc57.lr.ph.us.preheader, label %for.body35.preheader

for.inc57.lr.ph.us.preheader:                     ; preds = %for.body35.lr.ph
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv69
  br label %for.inc57.lr.ph.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* %scevgep73, i8 0, i64 %12, i32 8, i1 false)
  br label %for.cond.loopexit

for.inc57.lr.ph.us:                               ; preds = %for.inc83.us, %for.inc57.lr.ph.us.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv63, %for.inc57.lr.ph.us.preheader ], [ %indvars.iv.next66, %for.inc83.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv69, i64 %indvars.iv65
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 %lcmp.mod79, label %for.inc57.us.prol.preheader, label %for.inc57.us.prol.loopexit.unr-lcssa

for.inc57.us.prol.preheader:                      ; preds = %for.inc57.lr.ph.us
  %23 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv65
  %24 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %23, %24
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.inc57.us.prol.loopexit.unr-lcssa

for.inc57.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc57.lr.ph.us, %for.inc57.us.prol.preheader
  %25 = phi double [ %add56.us.prol, %for.inc57.us.prol.preheader ], [ 0.000000e+00, %for.inc57.lr.ph.us ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %for.inc57.us.prol.preheader ], [ 0, %for.inc57.lr.ph.us ]
  br i1 %8, label %for.inc80.us.preheader, label %for.inc57.us.preheader

for.inc57.us.preheader:                           ; preds = %for.inc57.us.prol.loopexit.unr-lcssa
  br label %for.inc57.us

for.inc57.us:                                     ; preds = %for.inc57.us.preheader, %for.inc57.us
  %26 = phi double [ %add56.us.1, %for.inc57.us ], [ %25, %for.inc57.us.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %for.inc57.us ], [ %indvars.iv55.unr.ph, %for.inc57.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv55, i64 %indvars.iv69
  %27 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv65
  %28 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %27, %28
  %add56.us = fadd double %26, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next56, i64 %indvars.iv69
  %29 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next56, i64 %indvars.iv65
  %30 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %29, %30
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %4
  br i1 %exitcond58.1, label %for.inc80.us.preheader.loopexit, label %for.inc57.us

for.inc80.us.preheader.loopexit:                  ; preds = %for.inc57.us
  br label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc80.us.preheader.loopexit, %for.inc57.us.prol.loopexit.unr-lcssa
  %31 = phi double [ %25, %for.inc57.us.prol.loopexit.unr-lcssa ], [ %add56.us.1, %for.inc80.us.preheader.loopexit ]
  br i1 %lcmp.mod79, label %for.inc80.us.prol.preheader, label %for.inc80.us.prol.loopexit.unr-lcssa

for.inc80.us.prol.preheader:                      ; preds = %for.inc80.us.preheader
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv65
  %32 = load double, double* %arrayidx66.us.prol, align 8
  %33 = load double, double* %arrayidx46.us.prol, align 8
  %mul75.us.prol = fmul double %33, %31
  %sub.us.prol = fsub double %32, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.inc80.us.prol.loopexit.unr-lcssa

for.inc80.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc80.us.preheader, %for.inc80.us.prol.preheader
  %indvars.iv59.unr.ph = phi i64 [ 1, %for.inc80.us.prol.preheader ], [ 0, %for.inc80.us.preheader ]
  br i1 %8, label %for.inc83.us, label %for.inc80.us.preheader86

for.inc80.us.preheader86:                         ; preds = %for.inc80.us.prol.loopexit.unr-lcssa
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.inc80.us.preheader86, %for.inc80.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.1, %for.inc80.us ], [ %indvars.iv59.unr.ph, %for.inc80.us.preheader86 ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv65
  %34 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv59, i64 %indvars.iv69
  %35 = load double, double* %arrayidx70.us, align 8
  %36 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %35, %36
  %sub.us = fsub double %34, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next60, i64 %indvars.iv65
  %37 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next60, i64 %indvars.iv69
  %38 = load double, double* %arrayidx70.us.1, align 8
  %39 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %38, %39
  %sub.us.1 = fsub double %37, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next60.1 = add nuw nsw i64 %indvars.iv59, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next60.1, %4
  br i1 %exitcond62.1, label %for.inc83.us.loopexit, label %for.inc80.us

for.inc83.us.loopexit:                            ; preds = %for.inc80.us
  br label %for.inc83.us

for.inc83.us:                                     ; preds = %for.inc83.us.loopexit, %for.inc80.us.prol.loopexit.unr-lcssa
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %1
  br i1 %exitcond68, label %for.cond.loopexit.loopexit, label %for.inc57.lr.ph.us

for.end88.loopexit:                               ; preds = %for.cond.loopexit
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
  br i1 %cmp8, label %for.body4.lr.ph.us.preheader, label %for.end12

for.body4.lr.ph.us.preheader:                     ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.inc10.us, %for.body4.lr.ph.us.preheader
  %indvars.iv24 = phi i64 [ 0, %for.body4.lr.ph.us.preheader ], [ %indvars.iv.next25, %for.inc10.us ]
  %5 = mul nsw i64 %indvars.iv24, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body4.lr.ph.us
  %indvars.iv19 = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next20, %for.inc.us ]
  %6 = add nsw i64 %indvars.iv19, %5
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv24, i64 %indvars.iv19
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next20, %4
  br i1 %exitcond30, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, %4
  br i1 %exitcond28, label %for.end12.loopexit, label %for.body4.lr.ph.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %cmp163.not = icmp slt i32 %m, 1
  %cmp8.not = xor i1 %cmp8, true
  %brmerge = or i1 %cmp163.not, %cmp8.not
  br i1 %brmerge, label %for.end38, label %for.body20.lr.ph.us.preheader

for.body20.lr.ph.us.preheader:                    ; preds = %for.end12
  %13 = sext i32 %n to i64
  %14 = zext i32 %n to i64
  %15 = zext i32 %m to i64
  br label %for.body20.lr.ph.us

for.body20.lr.ph.us:                              ; preds = %for.inc36.us, %for.body20.lr.ph.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.body20.lr.ph.us.preheader ], [ %indvars.iv.next14, %for.inc36.us ]
  %16 = mul nsw i64 %indvars.iv13, %13
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.inc33.us, %for.body20.lr.ph.us
  %indvars.iv = phi i64 [ 0, %for.body20.lr.ph.us ], [ %indvars.iv.next, %for.inc33.us ]
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
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv13, i64 %indvars.iv
  %21 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next, %14
  br i1 %exitcond29, label %for.inc36.us, label %for.body20.us

for.inc36.us:                                     ; preds = %for.inc33.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %15
  br i1 %exitcond, label %for.end38.loopexit, label %for.body20.lr.ph.us

for.end38.loopexit:                               ; preds = %for.inc36.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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

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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.cond15.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.body3.lr.ph.us.preheader, label %for.end32

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.inc12.us, %for.body3.lr.ph.us.preheader
  %indvars.iv18 = phi i64 [ 0, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next19, %for.inc12.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.lr.ph.us
  %indvars.iv11 = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next12, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv11, %indvars.iv18
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv11
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv18, i64 %indvars.iv11
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond, label %for.inc12.us, label %for.body3.us

for.inc12.us:                                     ; preds = %for.body3.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond25, label %for.cond15.preheader.loopexit, label %for.body3.lr.ph.us

for.cond15.preheader.loopexit:                    ; preds = %for.inc12.us
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.cond15.preheader.loopexit, %entry
  br i1 true, label %for.body22.lr.ph.us.preheader, label %for.end32

for.body22.lr.ph.us.preheader:                    ; preds = %for.cond15.preheader
  br i1 true, label %for.body22.lr.ph.us.prol.loopexit, label %for.body22.lr.ph.us.prol.preheader

for.body22.lr.ph.us.prol.preheader:               ; preds = %for.body22.lr.ph.us.preheader
  br label %for.body22.lr.ph.us.prol

for.body22.lr.ph.us.prol:                         ; preds = %for.body22.lr.ph.us.prol.preheader, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge
  %indvars.iv7.prol = phi i64 [ %indvars.iv.next8.prol, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge ], [ 0, %for.body22.lr.ph.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge ], [ 0, %for.body22.lr.ph.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv7.prol, i64 0
  %scevgep6.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.prol, i8 0, i64 9600, i32 8, i1 false)
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body22.lr.ph.us.prol.loopexit.loopexit, label %for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge, !llvm.loop !1

for.body22.lr.ph.us.prol.for.body22.lr.ph.us.prol_crit_edge: ; preds = %for.body22.lr.ph.us.prol
  %indvars.iv.next8.prol = add nuw nsw i64 %indvars.iv7.prol, 1
  br label %for.body22.lr.ph.us.prol

for.body22.lr.ph.us.prol.loopexit.loopexit:       ; preds = %for.body22.lr.ph.us.prol
  br label %for.body22.lr.ph.us.prol.loopexit

for.body22.lr.ph.us.prol.loopexit:                ; preds = %for.body22.lr.ph.us.prol.loopexit.loopexit, %for.body22.lr.ph.us.preheader
  br i1 false, label %for.end32, label %for.body22.lr.ph.us.preheader26

for.body22.lr.ph.us.preheader26:                  ; preds = %for.body22.lr.ph.us.prol.loopexit
  br i1 false, label %for.body22.lr.ph.us.prol.preheader27, label %for.body22.lr.ph.us.prol.loopexit28

for.body22.lr.ph.us.prol.preheader27:             ; preds = %for.body22.lr.ph.us.preheader26
  br label %for.body22.lr.ph.us.prol31

for.body22.lr.ph.us.prol31:                       ; preds = %for.body22.lr.ph.us.prol.preheader27
  %scevgep.prol33 = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 0
  %scevgep6.prol34 = bitcast double* %scevgep.prol33 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.prol34, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 1, i64 0
  %scevgep6.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.1.prol, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 2, i64 0
  %scevgep6.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.2.prol, i8 0, i64 9600, i32 8, i1 false)
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 3, i64 0
  %scevgep6.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.3.prol, i8 0, i64 9600, i32 8, i1 false)
  br label %for.body22.lr.ph.us.prol.loopexit28

for.body22.lr.ph.us.prol.loopexit28:              ; preds = %for.body22.lr.ph.us.prol31, %for.body22.lr.ph.us.preheader26
  %indvars.iv7.unr36 = phi i64 [ 0, %for.body22.lr.ph.us.preheader26 ], [ 4, %for.body22.lr.ph.us.prol31 ]
  br i1 false, label %for.end32.loopexit, label %for.body22.lr.ph.us.preheader26.new

for.body22.lr.ph.us.preheader26.new:              ; preds = %for.body22.lr.ph.us.prol.loopexit28
  br label %for.body22.lr.ph.us

for.body22.lr.ph.us:                              ; preds = %for.body22.lr.ph.us, %for.body22.lr.ph.us.preheader26.new
  %indvars.iv7 = phi i64 [ %indvars.iv7.unr36, %for.body22.lr.ph.us.preheader26.new ], [ %indvars.iv.next8.3.1, %for.body22.lr.ph.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv7, i64 0
  %scevgep6 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next8, i64 0
  %scevgep6.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next8.1, i64 0
  %scevgep6.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv7, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next8.2, i64 0
  %scevgep6.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next8.3 = add nsw i64 %indvars.iv7, 4
  %scevgep.137 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next8.3, i64 0
  %scevgep6.138 = bitcast double* %scevgep.137 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.138, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next8.139 = add nsw i64 %indvars.iv7, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next8.139, i64 0
  %scevgep6.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next8.1.1 = add nsw i64 %indvars.iv7, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next8.1.1, i64 0
  %scevgep6.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next8.2.1 = add nsw i64 %indvars.iv7, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next8.2.1, i64 0
  %scevgep6.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep6.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next8.3.1 = add nsw i64 %indvars.iv7, 8
  %exitcond10.3.1 = icmp eq i64 %indvars.iv.next8.3.1, 1200
  br i1 %exitcond10.3.1, label %for.end32.loopexit.unr-lcssa, label %for.body22.lr.ph.us

for.end32.loopexit.unr-lcssa:                     ; preds = %for.body22.lr.ph.us
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body22.lr.ph.us.prol.loopexit28, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.body22.lr.ph.us.prol.loopexit, %for.cond15.preheader, %for.cond1.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  br i1 true, label %for.cond1.preheader.preheader, label %for.end88

for.cond1.preheader.preheader:                    ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc86.for.cond1.preheader_crit_edge, %for.cond1.preheader.preheader
  %indvars.iv81 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next82, %for.inc86.for.cond1.preheader_crit_edge ]
  %indvars.iv73 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next74, %for.inc86.for.cond1.preheader_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv81, 1201
  %1 = add nuw nsw i64 %0, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %1
  %scevgep64 = bitcast double* %scevgep to i8*
  %2 = sub i64 1198, %indvars.iv81
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  %5 = add nuw nsw i64 %4, 8
  br i1 true, label %for.body3.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %for.cond1.preheader
  %arrayidx1392 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv81, i64 %indvars.iv81
  store double 0.000000e+00, double* %arrayidx1392, align 8
  br label %for.cond33.preheader

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 true, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol.for.body3.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0, %for.body3.prol.preheader ]
  %6 = phi double [ %add.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0.000000e+00, %for.body3.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.prol.for.body3.prol_crit_edge ], [ 0, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv81
  %7 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %7, %7
  %add.prol = fadd double %6, %mul.prol
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol.for.body3.prol_crit_edge, !llvm.loop !3

for.body3.prol.for.body3.prol_crit_edge:          ; preds = %for.body3.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.body3.prol

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %.unr = phi double [ 0.000000e+00, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  br i1 false, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ 0, %for.body3.preheader ]
  %8 = phi double [ %add.3, %for.body3 ], [ %.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv81
  %9 = load double, double* %arrayidx5, align 8
  %mul = fmul double %9, %9
  %add = fadd double %8, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv81
  %10 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %10, %10
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv81
  %11 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %11, %11
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv81
  %12 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %12, %12
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit
  %.lcssa = phi double [ %add.lcssa.unr, %for.body3.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %.lcssa) #3
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv81, i64 %indvars.iv81
  store double %call, double* %arrayidx13, align 8
  br i1 true, label %for.body16.prol.loopexit.unr-lcssa, label %for.body16.prol.preheader

for.body16.prol.preheader:                        ; preds = %for.end
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv81
  %13 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %13, %call
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv81
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.end, %for.body16.prol.preheader
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.body16.prol.preheader ], [ 0, %for.end ]
  br i1 false, label %for.cond33.preheader, label %for.body16.preheader

for.body16.preheader:                             ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.body16

for.cond33.preheader.loopexit:                    ; preds = %for.body16
  br label %for.cond33.preheader

for.cond33.preheader:                             ; preds = %for.cond33.preheader.loopexit, %for.body16.prol.loopexit.unr-lcssa, %for.end.thread
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %cmp3416 = icmp slt i64 %indvars.iv.next82, 1200
  br i1 %cmp3416, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.cond33.preheader
  br i1 true, label %for.body42.lr.ph.us.preheader, label %for.body35.preheader

for.body42.lr.ph.us.preheader:                    ; preds = %for.body35.lr.ph
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv81
  br label %for.body42.lr.ph.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  call void @llvm.memset.p0i8.i64(i8* %scevgep64, i8 0, i64 %5, i32 8, i1 false)
  br label %for.inc86

for.body42.lr.ph.us:                              ; preds = %for.cond33.loopexit.us, %for.body42.lr.ph.us.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv73, %for.body42.lr.ph.us.preheader ], [ %indvars.iv.next76, %for.cond33.loopexit.us ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv81, i64 %indvars.iv75
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 false, label %for.body42.us.prol.preheader, label %for.body42.us.prol.loopexit.unr-lcssa

for.body42.us.prol.preheader:                     ; preds = %for.body42.lr.ph.us
  %14 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv75
  %15 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %14, %15
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit.unr-lcssa

for.body42.us.prol.loopexit.unr-lcssa:            ; preds = %for.body42.lr.ph.us, %for.body42.us.prol.preheader
  %16 = phi double [ %add56.us.prol, %for.body42.us.prol.preheader ], [ 0.000000e+00, %for.body42.lr.ph.us ]
  %indvars.iv65.unr.ph = phi i64 [ 1, %for.body42.us.prol.preheader ], [ 0, %for.body42.lr.ph.us ]
  br i1 false, label %for.body62.lr.ph.us, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit.unr-lcssa
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %17 = phi double [ %add56.us.1, %for.body42.us ], [ %16, %for.body42.us.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66.1, %for.body42.us ], [ %indvars.iv65.unr.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv65, i64 %indvars.iv81
  %18 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv75
  %19 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %18, %19
  %add56.us = fadd double %17, %mul51.us
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next66, i64 %indvars.iv81
  %20 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next66, i64 %indvars.iv75
  %21 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %20, %21
  %add56.us.1 = fadd double %add56.us, %mul51.us.1
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next66.1 = add nuw nsw i64 %indvars.iv65, 2
  %exitcond68.1 = icmp eq i64 %indvars.iv.next66.1, 1000
  br i1 %exitcond68.1, label %for.body62.lr.ph.us.loopexit, label %for.body42.us

for.body62.lr.ph.us.loopexit:                     ; preds = %for.body42.us
  br label %for.body62.lr.ph.us

for.body62.lr.ph.us:                              ; preds = %for.body62.lr.ph.us.loopexit, %for.body42.us.prol.loopexit.unr-lcssa
  %22 = phi double [ %16, %for.body42.us.prol.loopexit.unr-lcssa ], [ %add56.us.1, %for.body62.lr.ph.us.loopexit ]
  br i1 false, label %for.body62.us.prol.preheader, label %for.body62.us.prol.loopexit.unr-lcssa

for.body62.us.prol.preheader:                     ; preds = %for.body62.lr.ph.us
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv75
  %23 = load double, double* %arrayidx66.us.prol, align 8
  %24 = load double, double* %arrayidx46.us.prol, align 8
  %mul75.us.prol = fmul double %24, %22
  %sub.us.prol = fsub double %23, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.prol.loopexit.unr-lcssa

for.body62.us.prol.loopexit.unr-lcssa:            ; preds = %for.body62.lr.ph.us, %for.body62.us.prol.preheader
  %indvars.iv69.unr.ph = phi i64 [ 1, %for.body62.us.prol.preheader ], [ 0, %for.body62.lr.ph.us ]
  br i1 false, label %for.cond33.loopexit.us, label %for.body62.us.preheader

for.body62.us.preheader:                          ; preds = %for.body62.us.prol.loopexit.unr-lcssa
  br label %for.body62.us

for.body62.us:                                    ; preds = %for.body62.us.preheader, %for.body62.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.1, %for.body62.us ], [ %indvars.iv69.unr.ph, %for.body62.us.preheader ]
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv75
  %25 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv69, i64 %indvars.iv81
  %26 = load double, double* %arrayidx70.us, align 8
  %27 = load double, double* %arrayidx39.us, align 8
  %mul75.us = fmul double %26, %27
  %sub.us = fsub double %25, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next70, i64 %indvars.iv75
  %28 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next70, i64 %indvars.iv81
  %29 = load double, double* %arrayidx70.us.1, align 8
  %30 = load double, double* %arrayidx39.us, align 8
  %mul75.us.1 = fmul double %29, %30
  %sub.us.1 = fsub double %28, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %indvars.iv.next70.1 = add nuw nsw i64 %indvars.iv69, 2
  %exitcond72.1 = icmp eq i64 %indvars.iv.next70.1, 1000
  br i1 %exitcond72.1, label %for.cond33.loopexit.us.loopexit, label %for.body62.us

for.cond33.loopexit.us.loopexit:                  ; preds = %for.body62.us
  br label %for.cond33.loopexit.us

for.cond33.loopexit.us:                           ; preds = %for.cond33.loopexit.us.loopexit, %for.body62.us.prol.loopexit.unr-lcssa
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond = icmp eq i64 %indvars.iv.next76, 1200
  br i1 %exitcond, label %for.inc86.loopexit, label %for.body42.lr.ph.us

for.body16:                                       ; preds = %for.body16.preheader, %for.body16
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %for.body16 ], [ %indvars.iv54.unr.ph, %for.body16.preheader ]
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv81
  %31 = load double, double* %arrayidx20, align 8
  %32 = load double, double* %arrayidx13, align 8
  %div = fdiv double %31, %32
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv54, i64 %indvars.iv81
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv81
  %33 = load double, double* %arrayidx20.1, align 8
  %34 = load double, double* %arrayidx13, align 8
  %div.1 = fdiv double %33, %34
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next55, i64 %indvars.iv81
  store double %div.1, double* %arrayidx28.1, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond57.1 = icmp eq i64 %indvars.iv.next55.1, 1000
  br i1 %exitcond57.1, label %for.cond33.preheader.loopexit, label %for.body16

for.inc86.loopexit:                               ; preds = %for.cond33.loopexit.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.cond33.preheader, %for.body35.preheader
  %exitcond93 = icmp eq i64 %indvars.iv.next82, 1200
  br i1 %exitcond93, label %for.end88.loopexit, label %for.inc86.for.cond1.preheader_crit_edge

for.inc86.for.cond1.preheader_crit_edge:          ; preds = %for.inc86
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  br label %for.cond1.preheader

for.end88.loopexit:                               ; preds = %for.inc86
  br label %for.end88

for.end88:                                        ; preds = %for.end88.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %R, [1200 x double]* %Q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body4.lr.ph.us.preheader, label %for.end12

for.body4.lr.ph.us.preheader:                     ; preds = %entry
  br label %for.body4.lr.ph.us

for.body4.lr.ph.us:                               ; preds = %for.inc10.us, %for.body4.lr.ph.us.preheader
  %indvars.iv18 = phi i64 [ 0, %for.body4.lr.ph.us.preheader ], [ %indvars.iv.next19, %for.inc10.us ]
  %3 = mul nsw i64 %indvars.iv18, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body4.lr.ph.us
  %indvars.iv13 = phi i64 [ 0, %for.body4.lr.ph.us ], [ %indvars.iv.next14, %if.end.us ]
  %4 = add nsw i64 %indvars.iv13, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv18, i64 %indvars.iv13
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond24, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond22, label %for.end12.loopexit, label %for.body4.lr.ph.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 false, label %for.end38, label %for.body20.lr.ph.us.preheader

for.body20.lr.ph.us.preheader:                    ; preds = %for.end12
  br label %for.body20.lr.ph.us

for.body20.lr.ph.us:                              ; preds = %for.inc36.us, %for.body20.lr.ph.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.body20.lr.ph.us.preheader ], [ %indvars.iv.next8, %for.inc36.us ]
  %11 = mul nsw i64 %indvars.iv7, 1200
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %if.end27.us

if.end27.us:                                      ; preds = %for.body20.us, %if.then25.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond23, label %for.inc36.us, label %for.body20.us

for.inc36.us:                                     ; preds = %if.end27.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond, label %for.end38.loopexit, label %for.body20.lr.ph.us

for.end38.loopexit:                               ; preds = %for.inc36.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

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
define i32 @main(i32 %argc, i8** %argv) #0 {
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

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) #0 {
entry:
  br i1 true, label %for.body.lr.ph, label %for.end14

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.end32

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc12_crit_edge.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond1.for.inc12_crit_edge.us ], [ 0, %for.body.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body.us
  %indvars.iv16 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next17, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv16, %indvars.iv22
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %mul5.us = fmul double %div.us, 1.000000e+02
  %add.us = fadd double %mul5.us, 1.000000e+01
  %arrayidx7.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv16
  store double %add.us, double* %arrayidx7.us, align 8
  %arrayidx11.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv22, i64 %indvars.iv16
  store double 0.000000e+00, double* %arrayidx11.us, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond25, label %for.end14.loopexit, label %for.body.us

for.end14.loopexit:                               ; preds = %for.cond1.for.inc12_crit_edge.us
  br label %for.end14

for.end14:                                        ; preds = %for.end14.loopexit, %entry
  br i1 true, label %for.body18.us.preheader, label %for.end32

for.body18.us.preheader:                          ; preds = %for.end14
  br i1 true, label %for.body18.us.prol.loopexit, label %for.body18.us.prol.preheader

for.body18.us.prol.preheader:                     ; preds = %for.body18.us.preheader
  br label %for.body18.us.prol

for.body18.us.prol:                               ; preds = %for.body18.us.prol.preheader, %for.body18.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body18.us.prol ], [ 0, %for.body18.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body18.us.prol ], [ 0, %for.body18.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.prol, i64 0
  %scevgep15.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.prol, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body18.us.prol.loopexit.loopexit, label %for.body18.us.prol, !llvm.loop !1

for.body18.us.prol.loopexit.loopexit:             ; preds = %for.body18.us.prol
  br label %for.body18.us.prol.loopexit

for.body18.us.prol.loopexit:                      ; preds = %for.body18.us.prol.loopexit.loopexit, %for.body18.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body18.us.preheader ], [ 4294967296, %for.body18.us.prol.loopexit.loopexit ]
  br i1 false, label %for.end32, label %for.body18.us.preheader28

for.body18.us.preheader28:                        ; preds = %for.body18.us.prol.loopexit
  %2 = sub nsw i64 1196, %indvars.iv.unr
  %3 = lshr i64 %2, 2
  %4 = and i64 %3, 1
  %lcmp.mod32 = icmp eq i64 %4, 0
  br i1 %lcmp.mod32, label %for.body18.us.prol.preheader29, label %for.body18.us.prol.loopexit30

for.body18.us.prol.preheader29:                   ; preds = %for.body18.us.preheader28
  br label %for.body18.us.prol33

for.body18.us.prol33:                             ; preds = %for.body18.us.prol.preheader29
  %scevgep.prol35 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.unr, i64 0
  %scevgep15.prol36 = bitcast double* %scevgep.prol35 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.prol36, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.prol37 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.prol37, i64 0
  %scevgep15.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.1.prol, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep15.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.2.prol, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep15.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.3.prol, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.body18.us.prol.loopexit30

for.body18.us.prol.loopexit30:                    ; preds = %for.body18.us.prol33, %for.body18.us.preheader28
  %indvars.iv.unr38 = phi i64 [ %indvars.iv.unr, %for.body18.us.preheader28 ], [ %indvars.iv.next.3.prol, %for.body18.us.prol33 ]
  %5 = icmp eq i64 %3, 0
  br i1 %5, label %for.end32.loopexit, label %for.body18.us.preheader28.new

for.body18.us.preheader28.new:                    ; preds = %for.body18.us.prol.loopexit30
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us, %for.body18.us.preheader28.new
  %indvars.iv = phi i64 [ %indvars.iv.unr38, %for.body18.us.preheader28.new ], [ %indvars.iv.next.3.1, %for.body18.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv, i64 0
  %scevgep15 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next, i64 0
  %scevgep15.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1, i64 0
  %scevgep15.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.2, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2, i64 0
  %scevgep15.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.3, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.139 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.3, i64 0
  %scevgep15.140 = bitcast double* %scevgep.139 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.140, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.141 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.141, i64 0
  %scevgep15.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.1.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.1.1, i64 0
  %scevgep15.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.2.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %R, i64 %indvars.iv.next.2.1, i64 0
  %scevgep15.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep15.3.1, i8 0, i64 9600, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.end32.loopexit.unr-lcssa, label %for.body18.us

for.end32.loopexit.unr-lcssa:                     ; preds = %for.body18.us
  br label %for.end32.loopexit

for.end32.loopexit:                               ; preds = %for.body18.us.prol.loopexit30, %for.end32.loopexit.unr-lcssa
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %for.body.lr.ph, %for.body18.us.prol.loopexit, %for.end14
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32 %m, i32 %n, [1200 x double]* %A, [1200 x double]* %R, [1200 x double]* %Q) #0 {
entry:
  br i1 true, label %for.body.lr.ph, label %for.end88

for.body.lr.ph:                                   ; preds = %entry
  %sunkaddr = ptrtoint [1200 x double]* %Q to i64
  br label %for.body

for.body:                                         ; preds = %for.inc86, %for.body.lr.ph
  %indvars.iv119 = phi i64 [ 0, %for.body.lr.ph ], [ %0, %for.inc86 ]
  %indvars.iv110 = phi i64 [ 1, %for.body.lr.ph ], [ %indvars.iv.next111, %for.inc86 ]
  %0 = add nuw nsw i64 %indvars.iv119, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %R, i64 0, i64 %0
  %1 = sub i64 1198, %indvars.iv119
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  %4 = add nuw nsw i64 %3, 8
  br i1 true, label %for.body3.lr.ph, label %for.end.thread

for.end.thread:                                   ; preds = %for.body
  %arrayidx13124 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv119, i64 %indvars.iv119
  store double 0.000000e+00, double* %arrayidx13124, align 8
  br label %for.end31

for.body3.lr.ph:                                  ; preds = %for.body
  br i1 true, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %add3.prol = phi double [ %add.prol, %for.body3.prol ], [ 0.000000e+00, %for.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.prol, i64 %indvars.iv119
  %5 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %5, %5
  %add.prol = fadd double %add3.prol, %mul.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !3

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph ], [ 4294967296, %for.body3.prol.loopexit.loopexit ]
  %add3.unr = phi double [ 0.000000e+00, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  %add.lcssa.unr = phi double [ undef, %for.body3.lr.ph ], [ %add.prol, %for.body3.prol.loopexit.loopexit ]
  br i1 false, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ %indvars.iv.unr, %for.body3.preheader ]
  %add3 = phi double [ %add.3, %for.body3 ], [ %add3.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv, i64 %indvars.iv119
  %6 = load double, double* %arrayidx5, align 8
  %mul = fmul double %6, %6
  %add = fadd double %add3, %mul
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv119
  %7 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %7, %7
  %add.1 = fadd double %add, %mul.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.1, i64 %indvars.iv119
  %8 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %8, %8
  %add.2 = fadd double %add.1, %mul.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next.2, i64 %indvars.iv119
  %9 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %9, %9
  %add.3 = fadd double %add.2, %mul.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1000
  br i1 %exitcond.3, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit
  %add.lcssa72 = phi double [ %add.lcssa.unr, %for.body3.prol.loopexit ], [ %add.3, %for.end.loopexit ]
  %call = tail call double @sqrt(double %add.lcssa72) #4
  %arrayidx13 = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv119, i64 %indvars.iv119
  store double %call, double* %arrayidx13, align 8
  br i1 true, label %for.body16.preheader, label %for.end.for.end31_crit_edge

for.end.for.end31_crit_edge:                      ; preds = %for.end
  br label %for.end31

for.body16.preheader:                             ; preds = %for.end
  %arrayidx20128 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv119
  %10 = load double, double* %arrayidx20128, align 8
  %div129 = fdiv double %10, %call
  %arrayidx28130 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv119
  store double %div129, double* %arrayidx28130, align 8
  br i1 false, label %for.end31, label %for.body16.for.body16_crit_edge.preheader

for.body16.for.body16_crit_edge.preheader:        ; preds = %for.body16.preheader
  br i1 false, label %for.body16.for.body16_crit_edge.prol.loopexit.unr-lcssa, label %for.body16.for.body16_crit_edge.prol.preheader

for.body16.for.body16_crit_edge.prol.preheader:   ; preds = %for.body16.for.body16_crit_edge.preheader
  br label %for.body16.for.body16_crit_edge.prol

for.body16.for.body16_crit_edge.prol:             ; preds = %for.body16.for.body16_crit_edge.prol.preheader
  %.pre.prol = load double, double* %arrayidx13, align 8
  %arrayidx20.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 1, i64 %indvars.iv119
  %11 = load double, double* %arrayidx20.prol, align 8
  %div.prol = fdiv double %11, %.pre.prol
  %arrayidx28.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 1, i64 %indvars.iv119
  store double %div.prol, double* %arrayidx28.prol, align 8
  br label %for.body16.for.body16_crit_edge.prol.loopexit.unr-lcssa

for.body16.for.body16_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body16.for.body16_crit_edge.preheader, %for.body16.for.body16_crit_edge.prol
  %indvars.iv78132.unr.ph = phi i64 [ 1, %for.body16.for.body16_crit_edge.prol ], [ 0, %for.body16.for.body16_crit_edge.preheader ]
  br label %for.body16.for.body16_crit_edge.prol.loopexit

for.body16.for.body16_crit_edge.prol.loopexit:    ; preds = %for.body16.for.body16_crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %for.end31.loopexit, label %for.body16.for.body16_crit_edge.preheader.new

for.body16.for.body16_crit_edge.preheader.new:    ; preds = %for.body16.for.body16_crit_edge.prol.loopexit
  br label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16.for.body16_crit_edge, %for.body16.for.body16_crit_edge.preheader.new
  %indvars.iv78132 = phi i64 [ %indvars.iv78132.unr.ph, %for.body16.for.body16_crit_edge.preheader.new ], [ %indvars.iv.next79.1, %for.body16.for.body16_crit_edge ]
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78132, 1
  %.pre = load double, double* %arrayidx13, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next79, i64 %indvars.iv119
  %12 = load double, double* %arrayidx20, align 8
  %div = fdiv double %12, %.pre
  %arrayidx28 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next79, i64 %indvars.iv119
  store double %div, double* %arrayidx28, align 8
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78132, 2
  %.pre.1 = load double, double* %arrayidx13, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next79.1, i64 %indvars.iv119
  %13 = load double, double* %arrayidx20.1, align 8
  %div.1 = fdiv double %13, %.pre.1
  %arrayidx28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next79.1, i64 %indvars.iv119
  store double %div.1, double* %arrayidx28.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next79.1, 999
  br i1 %exitcond.1, label %for.end31.loopexit.unr-lcssa, label %for.body16.for.body16_crit_edge

for.end31.loopexit.unr-lcssa:                     ; preds = %for.body16.for.body16_crit_edge
  br label %for.end31.loopexit

for.end31.loopexit:                               ; preds = %for.body16.for.body16_crit_edge.prol.loopexit, %for.end31.loopexit.unr-lcssa
  br label %for.end31

for.end31:                                        ; preds = %for.end31.loopexit, %for.end.for.end31_crit_edge, %for.body16.preheader, %for.end.thread
  %cmp3413 = icmp slt i64 %0, 1200
  br i1 %cmp3413, label %for.body35.lr.ph, label %for.inc86

for.body35.lr.ph:                                 ; preds = %for.end31
  br i1 true, label %for.body35.us.preheader, label %for.body35.preheader

for.body35.us.preheader:                          ; preds = %for.body35.lr.ph
  %arrayidx70.us134 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 0, i64 %indvars.iv119
  %arrayidx70.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 1, i64 %indvars.iv119
  %sunkaddr125 = shl nuw nsw i64 %indvars.iv119, 3
  %sunkaddr126 = add i64 %sunkaddr, %sunkaddr125
  %sunkaddr127 = inttoptr i64 %sunkaddr126 to double*
  br label %for.body35.us

for.body35.us:                                    ; preds = %for.body35.us.preheader, %for.inc83.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %for.inc83.us ], [ %indvars.iv110, %for.body35.us.preheader ]
  %arrayidx39.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv119, i64 %indvars.iv112
  store double 0.000000e+00, double* %arrayidx39.us, align 8
  br i1 true, label %for.body42.us.prol.loopexit.unr-lcssa, label %for.body42.us.prol.preheader

for.body42.us.prol.preheader:                     ; preds = %for.body35.us
  %14 = load double, double* %sunkaddr127, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv112
  %15 = load double, double* %arrayidx50.us.prol, align 8
  %mul51.us.prol = fmul double %14, %15
  %add56.us.prol = fadd double %mul51.us.prol, 0.000000e+00
  store double %add56.us.prol, double* %arrayidx39.us, align 8
  br label %for.body42.us.prol.loopexit.unr-lcssa

for.body42.us.prol.loopexit.unr-lcssa:            ; preds = %for.body35.us, %for.body42.us.prol.preheader
  %indvars.iv100.unr.ph = phi i64 [ 1, %for.body42.us.prol.preheader ], [ 0, %for.body35.us ]
  %.unr.ph = phi double [ %add56.us.prol, %for.body42.us.prol.preheader ], [ 0.000000e+00, %for.body35.us ]
  %add56.us.lcssa.unr.ph = phi double [ %add56.us.prol, %for.body42.us.prol.preheader ], [ undef, %for.body35.us ]
  br i1 false, label %for.body62.us.preheader, label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.prol.loopexit.unr-lcssa
  br label %for.body42.us

for.body62.us.preheader.loopexit:                 ; preds = %for.body42.us
  br label %for.body62.us.preheader

for.body62.us.preheader:                          ; preds = %for.body62.us.preheader.loopexit, %for.body42.us.prol.loopexit.unr-lcssa
  %.ph = phi double [ %add56.us.lcssa.unr.ph, %for.body42.us.prol.loopexit.unr-lcssa ], [ %add56.us.1, %for.body62.us.preheader.loopexit ]
  %arrayidx66.us133 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 0, i64 %indvars.iv112
  %16 = load double, double* %arrayidx66.us133, align 8
  %17 = load double, double* %arrayidx70.us134, align 8
  %mul75.us135 = fmul double %17, %.ph
  %sub.us136 = fsub double %16, %mul75.us135
  store double %sub.us136, double* %arrayidx66.us133, align 8
  br i1 false, label %for.inc83.us, label %for.body62.us.for.body62.us_crit_edge.preheader

for.body62.us.for.body62.us_crit_edge.preheader:  ; preds = %for.body62.us.preheader
  br i1 false, label %for.body62.us.for.body62.us_crit_edge.prol.loopexit.unr-lcssa, label %for.body62.us.for.body62.us_crit_edge.prol.preheader

for.body62.us.for.body62.us_crit_edge.prol.preheader: ; preds = %for.body62.us.for.body62.us_crit_edge.preheader
  br label %for.body62.us.for.body62.us_crit_edge.prol

for.body62.us.for.body62.us_crit_edge.prol:       ; preds = %for.body62.us.for.body62.us_crit_edge.prol.preheader
  %.pre75.prol = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 1, i64 %indvars.iv112
  %18 = load double, double* %arrayidx66.us.prol, align 8
  %19 = load double, double* %arrayidx70.us.prol, align 8
  %mul75.us.prol = fmul double %19, %.pre75.prol
  %sub.us.prol = fsub double %18, %mul75.us.prol
  store double %sub.us.prol, double* %arrayidx66.us.prol, align 8
  br label %for.body62.us.for.body62.us_crit_edge.prol.loopexit.unr-lcssa

for.body62.us.for.body62.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body62.us.for.body62.us_crit_edge.preheader, %for.body62.us.for.body62.us_crit_edge.prol
  %indvars.iv106138.unr.ph = phi i64 [ 1, %for.body62.us.for.body62.us_crit_edge.prol ], [ 0, %for.body62.us.for.body62.us_crit_edge.preheader ]
  br label %for.body62.us.for.body62.us_crit_edge.prol.loopexit

for.body62.us.for.body62.us_crit_edge.prol.loopexit: ; preds = %for.body62.us.for.body62.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %for.inc83.us.loopexit, label %for.body62.us.for.body62.us_crit_edge.preheader.new

for.body62.us.for.body62.us_crit_edge.preheader.new: ; preds = %for.body62.us.for.body62.us_crit_edge.prol.loopexit
  br label %for.body62.us.for.body62.us_crit_edge

for.inc83.us.loopexit.unr-lcssa:                  ; preds = %for.body62.us.for.body62.us_crit_edge
  br label %for.inc83.us.loopexit

for.inc83.us.loopexit:                            ; preds = %for.body62.us.for.body62.us_crit_edge.prol.loopexit, %for.inc83.us.loopexit.unr-lcssa
  br label %for.inc83.us

for.inc83.us:                                     ; preds = %for.inc83.us.loopexit, %for.body62.us.preheader
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 1200
  br i1 %exitcond115, label %for.inc86.loopexit, label %for.body35.us

for.body62.us.for.body62.us_crit_edge:            ; preds = %for.body62.us.for.body62.us_crit_edge, %for.body62.us.for.body62.us_crit_edge.preheader.new
  %indvars.iv106138 = phi i64 [ %indvars.iv106138.unr.ph, %for.body62.us.for.body62.us_crit_edge.preheader.new ], [ %indvars.iv.next107.1, %for.body62.us.for.body62.us_crit_edge ]
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106138, 1
  %.pre75 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next107, i64 %indvars.iv112
  %20 = load double, double* %arrayidx66.us, align 8
  %arrayidx70.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next107, i64 %indvars.iv119
  %21 = load double, double* %arrayidx70.us, align 8
  %mul75.us = fmul double %21, %.pre75
  %sub.us = fsub double %20, %mul75.us
  store double %sub.us, double* %arrayidx66.us, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106138, 2
  %.pre75.1 = load double, double* %arrayidx39.us, align 8
  %arrayidx66.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next107.1, i64 %indvars.iv112
  %22 = load double, double* %arrayidx66.us.1, align 8
  %arrayidx70.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next107.1, i64 %indvars.iv119
  %23 = load double, double* %arrayidx70.us.1, align 8
  %mul75.us.1 = fmul double %23, %.pre75.1
  %sub.us.1 = fsub double %22, %mul75.us.1
  store double %sub.us.1, double* %arrayidx66.us.1, align 8
  %exitcond109.1 = icmp eq i64 %indvars.iv.next107.1, 999
  br i1 %exitcond109.1, label %for.inc83.us.loopexit.unr-lcssa, label %for.body62.us.for.body62.us_crit_edge

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %for.body42.us ], [ %indvars.iv100.unr.ph, %for.body42.us.preheader ]
  %24 = phi double [ %add56.us.1, %for.body42.us ], [ %.unr.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv100, i64 %indvars.iv119
  %25 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv100, i64 %indvars.iv112
  %26 = load double, double* %arrayidx50.us, align 8
  %mul51.us = fmul double %25, %26
  %add56.us = fadd double %mul51.us, %24
  store double %add56.us, double* %arrayidx39.us, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv.next101, i64 %indvars.iv119
  %27 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv.next101, i64 %indvars.iv112
  %28 = load double, double* %arrayidx50.us.1, align 8
  %mul51.us.1 = fmul double %27, %28
  %add56.us.1 = fadd double %mul51.us.1, %add56.us
  store double %add56.us.1, double* %arrayidx39.us, align 8
  %indvars.iv.next101.1 = add nuw nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, 1000
  br i1 %exitcond103.1, label %for.body62.us.preheader.loopexit, label %for.body42.us

for.body35.preheader:                             ; preds = %for.body35.lr.ph
  %29 = mul i64 %indvars.iv119, 1200
  %scevgep87 = getelementptr double, double* %scevgep, i64 %29
  %scevgep8788 = bitcast double* %scevgep87 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8788, i8 0, i64 %4, i32 8, i1 false)
  br label %for.inc86

for.inc86.loopexit:                               ; preds = %for.inc83.us
  br label %for.inc86

for.inc86:                                        ; preds = %for.inc86.loopexit, %for.body35.preheader, %for.end31
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond122 = icmp eq i64 %0, 1200
  br i1 %exitcond122, label %for.end88.loopexit, label %for.body

for.end88.loopexit:                               ; preds = %for.inc86
  br label %for.end88

for.end88:                                        ; preds = %for.end88.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %R, [1200 x double]* %Q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv31 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next32, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 1200, %indvars.iv31
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv26 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next27, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv26
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc16 = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %R, i64 %indvars.iv31, i64 %indvars.iv26
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond30, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond35, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br i1 false, label %for.end38, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %for.end12
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.cond18.for.inc36_crit_edge.us, %for.body17.us.preheader
  %indvars.iv20 = phi i64 [ 0, %for.body17.us.preheader ], [ %indvars.iv.next21, %for.cond18.for.inc36_crit_edge.us ]
  %11 = mul nsw i64 1200, %indvars.iv20
  br label %for.body20.us

for.body20.us:                                    ; preds = %if.end27.us, %for.body17.us
  %indvars.iv = phi i64 [ 0, %for.body17.us ], [ %indvars.iv.next, %if.end27.us ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %rem23.us = srem i32 %13, 20
  %cmp24.us = icmp eq i32 %rem23.us, 0
  br i1 %cmp24.us, label %if.then25.us, label %if.end27.us

if.then25.us:                                     ; preds = %for.body20.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %if.end27.us

if.end27.us:                                      ; preds = %if.then25.us, %for.body20.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %Q, i64 %indvars.iv20, i64 %indvars.iv
  %16 = load double, double* %arrayidx31.us, align 8
  %call32.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %if.end27.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond24, label %for.end38.loopexit, label %for.body17.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.end12
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare double @sqrt(double) #2

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %arraydecay = bitcast i8* %call2 to [1100 x double]*
  %arraydecay9 = bitcast i8* %call4 to [900 x double]*
  %arraydecay10 = bitcast i8* %call6 to [1200 x double]*
  %arraydecay11 = bitcast i8* %call8 to [1200 x double]*
  call void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay12 = bitcast i8* %call to [900 x double]*
  call void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %0, double %1, [900 x double]* %arraydecay12, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @print_array(i32 800, i32 1200, [1200 x double]* %arraydecay11)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call6) #4
  call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br i1 true, label %for.body.lr.ph, label %for.end9

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.end33

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.body.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body.us
  %indvars.iv67 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next68, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv67, %indvars.iv73
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 8.000000e+02
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv73, i64 %indvars.iv67
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next68, 1100
  br i1 %exitcond72, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 800
  br i1 %exitcond76, label %for.end9.loopexit, label %for.body.us

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %entry
  br i1 true, label %for.body13.lr.ph, label %for.end33

for.body13.lr.ph:                                 ; preds = %for.end9
  br i1 true, label %for.body13.us.preheader, label %for.end58

for.body13.us.preheader:                          ; preds = %for.body13.lr.ph
  br label %for.body13.us

for.body13.us:                                    ; preds = %for.body13.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.body13.us.preheader ]
  br i1 true, label %for.body17.us.prol.loopexit.unr-lcssa, label %for.body17.us.prol.preheader

for.body17.us.prol.preheader:                     ; preds = %for.body13.us
  %3 = trunc i64 %indvars.iv62 to i32
  %rem20.us.prol = srem i32 %3, 900
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, 9.000000e+02
  %arrayidx27.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv62, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit.unr-lcssa

for.body17.us.prol.loopexit.unr-lcssa:            ; preds = %for.body13.us, %for.body17.us.prol.preheader
  %indvars.iv57.unr.ph = phi i64 [ 1, %for.body17.us.prol.preheader ], [ 0, %for.body13.us ]
  br i1 false, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %for.body17.us.prol.loopexit.unr-lcssa
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.preheader, %for.body17.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.1, %for.body17.us ], [ %indvars.iv57.unr.ph, %for.body17.us.preheader ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %4 = mul nuw nsw i64 %indvars.iv.next58, %indvars.iv62
  %5 = trunc i64 %4 to i32
  %rem20.us = srem i32 %5, 900
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv62, i64 %indvars.iv57
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %6 = mul nuw nsw i64 %indvars.iv.next58.1, %indvars.iv62
  %7 = trunc i64 %6 to i32
  %rem20.us.1 = srem i32 %7, 900
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, <double 9.000000e+02, double 9.000000e+02>
  %8 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %8, align 8
  %exitcond61.1 = icmp eq i64 %indvars.iv.next58.1, 900
  br i1 %exitcond61.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.body17.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.body17.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.body17.us.prol.loopexit.unr-lcssa
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 1100
  br i1 %exitcond65, label %for.end33.loopexit, label %for.body13.us

for.end33.loopexit:                               ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit, %for.body.lr.ph, %for.end9
  br i1 true, label %for.body37.lr.ph, label %for.end58

for.body37.lr.ph:                                 ; preds = %for.end33
  br i1 true, label %for.body37.us.preheader, label %for.end58

for.body37.us.preheader:                          ; preds = %for.body37.lr.ph
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.preheader, %for.cond38.for.inc56_crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond38.for.inc56_crit_edge.us ], [ 0, %for.body37.us.preheader ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.body37.us
  %indvars.iv45 = phi i64 [ 0, %for.body37.us ], [ %indvars.iv.next46, %for.body41.us ]
  %9 = add nuw nsw i64 %indvars.iv45, 3
  %10 = mul nuw nsw i64 %9, %indvars.iv52
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %rem45.us = srem i32 %12, 1200
  %conv46.us = sitofp i32 %rem45.us to double
  %div48.us = fdiv double %conv46.us, 1.200000e+03
  %arrayidx52.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv52, i64 %indvars.iv45
  store double %div48.us, double* %arrayidx52.us, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond51, label %for.cond38.for.inc56_crit_edge.us, label %for.body41.us

for.cond38.for.inc56_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 900
  br i1 %exitcond55, label %for.end58.loopexit, label %for.body37.us

for.end58.loopexit:                               ; preds = %for.cond38.for.inc56_crit_edge.us
  br label %for.end58

for.end58:                                        ; preds = %for.end58.loopexit, %for.body13.lr.ph, %for.body37.lr.ph, %for.end33
  br i1 true, label %for.body62.lr.ph, label %for.end82

for.body62.lr.ph:                                 ; preds = %for.end58
  br i1 true, label %for.body62.us.preheader, label %for.end82

for.body62.us.preheader:                          ; preds = %for.body62.lr.ph
  br label %for.body62.us

for.body62.us:                                    ; preds = %for.body62.us.preheader, %for.cond63.for.inc80_crit_edge.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond63.for.inc80_crit_edge.us ], [ 0, %for.body62.us.preheader ]
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us, %for.body62.us
  %indvars.iv = phi i64 [ 0, %for.body62.us ], [ %indvars.iv.next, %for.body66.us ]
  %13 = add nuw nsw i64 %indvars.iv, 2
  %14 = mul nuw nsw i64 %13, %indvars.iv40
  %15 = trunc i64 %14 to i32
  %rem69.us = srem i32 %15, 1100
  %conv70.us = sitofp i32 %rem69.us to double
  %div72.us = fdiv double %conv70.us, 1.100000e+03
  %arrayidx76.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv40, i64 %indvars.iv
  store double %div72.us, double* %arrayidx76.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond63.for.inc80_crit_edge.us, label %for.body66.us

for.cond63.for.inc80_crit_edge.us:                ; preds = %for.body66.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 800
  br i1 %exitcond43, label %for.end82.loopexit, label %for.body62.us

for.end82.loopexit:                               ; preds = %for.cond63.for.inc80_crit_edge.us
  br label %for.end82

for.end82:                                        ; preds = %for.end82.loopexit, %for.body62.lr.ph, %for.end58
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [900 x double]* %tmp, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) #0 {
entry:
  br i1 true, label %for.body.lr.ph, label %for.end67

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.body33.lr.ph

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond4.for.inc28_crit_edge.us, %for.body.us.preheader
  %indvars.iv127 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next128, %for.cond4.for.inc28_crit_edge.us ]
  br i1 true, label %for.body6.us.us.preheader, label %for.body6.us58.preheader

for.body6.us.us.preheader:                        ; preds = %for.body.us
  %arrayidx15.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv127, i64 0
  br label %for.body6.us.us

for.body6.us58.preheader:                         ; preds = %for.body.us
  %scevgep = getelementptr [900 x double], [900 x double]* %tmp, i64 %indvars.iv127, i64 0
  %scevgep113 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep113, i8 0, i64 7200, i32 8, i1 false)
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us.loopexit:        ; preds = %for.cond9.for.inc25_crit_edge.us.us
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us:                 ; preds = %for.cond4.for.inc28_crit_edge.us.loopexit, %for.body6.us58.preheader
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next128, 800
  br i1 %exitcond130, label %for.end30, label %for.body.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv121 = phi i64 [ %indvars.iv.next122, %for.cond9.for.inc25_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv127, i64 %indvars.iv121
  store double 0.000000e+00, double* %arrayidx8.us.us, align 8
  br i1 true, label %for.body11.us.us.prol.loopexit.unr-lcssa, label %for.body11.us.us.prol.preheader

for.body11.us.us.prol.preheader:                  ; preds = %for.body6.us.us
  %0 = load double, double* %arrayidx15.us.us.prol, align 8
  %mul.us.us.prol = fmul double %0, %alpha
  %arrayidx19.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv121
  %1 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul20.us.us.prol = fmul double %mul.us.us.prol, %1
  %add.us.us.prol = fadd double %mul20.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx8.us.us, align 8
  br label %for.body11.us.us.prol.loopexit.unr-lcssa

for.body11.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body6.us.us, %for.body11.us.us.prol.preheader
  %indvars.iv114.unr.ph = phi i64 [ 1, %for.body11.us.us.prol.preheader ], [ 0, %for.body6.us.us ]
  %.unr120.ph = phi double [ %add.us.us.prol, %for.body11.us.us.prol.preheader ], [ 0.000000e+00, %for.body6.us.us ]
  br i1 false, label %for.cond9.for.inc25_crit_edge.us.us, label %for.body11.us.us.preheader

for.body11.us.us.preheader:                       ; preds = %for.body11.us.us.prol.loopexit.unr-lcssa
  br label %for.body11.us.us

for.cond9.for.inc25_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us
  br label %for.cond9.for.inc25_crit_edge.us.us

for.cond9.for.inc25_crit_edge.us.us:              ; preds = %for.cond9.for.inc25_crit_edge.us.us.loopexit, %for.body11.us.us.prol.loopexit.unr-lcssa
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond124 = icmp eq i64 %indvars.iv.next122, 900
  br i1 %exitcond124, label %for.cond4.for.inc28_crit_edge.us.loopexit, label %for.body6.us.us

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader, %for.body11.us.us
  %indvars.iv114 = phi i64 [ %indvars.iv.next115.1, %for.body11.us.us ], [ %indvars.iv114.unr.ph, %for.body11.us.us.preheader ]
  %2 = phi double [ %add.us.us.1, %for.body11.us.us ], [ %.unr120.ph, %for.body11.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv127, i64 %indvars.iv114
  %3 = load double, double* %arrayidx15.us.us, align 8
  %mul.us.us = fmul double %3, %alpha
  %arrayidx19.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv114, i64 %indvars.iv121
  %4 = load double, double* %arrayidx19.us.us, align 8
  %mul20.us.us = fmul double %mul.us.us, %4
  %add.us.us = fadd double %mul20.us.us, %2
  store double %add.us.us, double* %arrayidx8.us.us, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv127, i64 %indvars.iv.next115
  %5 = load double, double* %arrayidx15.us.us.1, align 8
  %mul.us.us.1 = fmul double %5, %alpha
  %arrayidx19.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next115, i64 %indvars.iv121
  %6 = load double, double* %arrayidx19.us.us.1, align 8
  %mul20.us.us.1 = fmul double %mul.us.us.1, %6
  %add.us.us.1 = fadd double %mul20.us.us.1, %add.us.us
  store double %add.us.us.1, double* %arrayidx8.us.us, align 8
  %indvars.iv.next115.1 = add nuw nsw i64 %indvars.iv114, 2
  %exitcond117.1 = icmp eq i64 %indvars.iv.next115.1, 1100
  br i1 %exitcond117.1, label %for.cond9.for.inc25_crit_edge.us.us.loopexit, label %for.body11.us.us

for.end30:                                        ; preds = %for.cond4.for.inc28_crit_edge.us
  br i1 true, label %for.body33.us.preheader, label %for.end67

for.body33.lr.ph:                                 ; preds = %for.body.lr.ph
  br i1 true, label %for.body33.lr.ph.for.body33.us.preheader_crit_edge, label %for.end67

for.body33.lr.ph.for.body33.us.preheader_crit_edge: ; preds = %for.body33.lr.ph
  br label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.lr.ph.for.body33.us.preheader_crit_edge, %for.end30
  %7 = insertelement <2 x double> undef, double %beta, i32 0
  %mul41.us17.v.i0.2 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.cond34.for.inc65_crit_edge.us, %for.body33.us.preheader
  %indvars.iv104 = phi i64 [ 0, %for.body33.us.preheader ], [ %indvars.iv.next105, %for.cond34.for.inc65_crit_edge.us ]
  br i1 true, label %for.body36.us.us.preheader, label %for.body36.us13.preheader

for.body36.us.us.preheader:                       ; preds = %for.body33.us
  %arrayidx48.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv104, i64 0
  br label %for.body36.us.us

for.body36.us13.preheader:                        ; preds = %for.body33.us
  br i1 true, label %for.body36.us13.prol.loopexit, label %for.body36.us13.prol.preheader

for.body36.us13.prol.preheader:                   ; preds = %for.body36.us13.preheader
  br label %for.body36.us13.prol

for.body36.us13.prol:                             ; preds = %for.body36.us13.prol.preheader, %for.body36.us13.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body36.us13.prol ], [ 0, %for.body36.us13.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body36.us13.prol ], [ 0, %for.body36.us13.prol.preheader ]
  %arrayidx40.us16.prol = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv104, i64 %indvars.iv.prol
  %8 = load double, double* %arrayidx40.us16.prol, align 8
  %mul41.us17.prol = fmul double %8, %beta
  store double %mul41.us17.prol, double* %arrayidx40.us16.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body36.us13.prol.loopexit.loopexit, label %for.body36.us13.prol, !llvm.loop !1

for.body36.us13.prol.loopexit.loopexit:           ; preds = %for.body36.us13.prol
  br label %for.body36.us13.prol.loopexit

for.body36.us13.prol.loopexit:                    ; preds = %for.body36.us13.prol.loopexit.loopexit, %for.body36.us13.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body36.us13.preheader ], [ 4294967296, %for.body36.us13.prol.loopexit.loopexit ]
  br i1 false, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us13.preheader138

for.body36.us13.preheader138:                     ; preds = %for.body36.us13.prol.loopexit
  br i1 false, label %for.body36.us13.prol.preheader140, label %for.body36.us13.prol.loopexit141.unr-lcssa

for.body36.us13.prol.preheader140:                ; preds = %for.body36.us13.preheader138
  br label %for.body36.us13.prol143

for.body36.us13.prol143:                          ; preds = %for.body36.us13.prol.preheader140
  %arrayidx40.us16.prol145 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv104, i64 %indvars.iv.unr
  %9 = bitcast double* %arrayidx40.us16.prol145 to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul41.us17.prol146 = fmul <2 x double> %mul41.us17.v.i0.2, %10
  store <2 x double> %mul41.us17.prol146, <2 x double>* %9, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %arrayidx40.us16.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv104, i64 %indvars.iv.next.1.prol
  %11 = bitcast double* %arrayidx40.us16.2.prol to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %mul41.us17.2.prol = fmul <2 x double> %mul41.us17.v.i0.2, %12
  store <2 x double> %mul41.us17.2.prol, <2 x double>* %11, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.body36.us13.prol.loopexit141.unr-lcssa

for.body36.us13.prol.loopexit141.unr-lcssa:       ; preds = %for.body36.us13.preheader138, %for.body36.us13.prol143
  %indvars.iv.unr147.ph = phi i64 [ %indvars.iv.next.3.prol, %for.body36.us13.prol143 ], [ %indvars.iv.unr, %for.body36.us13.preheader138 ]
  br label %for.body36.us13.prol.loopexit141

for.body36.us13.prol.loopexit141:                 ; preds = %for.body36.us13.prol.loopexit141.unr-lcssa
  br i1 false, label %for.cond34.for.inc65_crit_edge.us.loopexit139, label %for.body36.us13.preheader138.new

for.body36.us13.preheader138.new:                 ; preds = %for.body36.us13.prol.loopexit141
  br label %for.body36.us13

for.body36.us13:                                  ; preds = %for.body36.us13, %for.body36.us13.preheader138.new
  %indvars.iv = phi i64 [ %indvars.iv.unr147.ph, %for.body36.us13.preheader138.new ], [ %indvars.iv.next.3.1, %for.body36.us13 ]
  %arrayidx40.us16 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv104, i64 %indvars.iv
  %13 = bitcast double* %arrayidx40.us16 to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %mul41.us17 = fmul <2 x double> %mul41.us17.v.i0.2, %14
  store <2 x double> %mul41.us17, <2 x double>* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx40.us16.2 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %15 = bitcast double* %arrayidx40.us16.2 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %mul41.us17.2 = fmul <2 x double> %mul41.us17.v.i0.2, %16
  store <2 x double> %mul41.us17.2, <2 x double>* %15, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx40.us16.1 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %17 = bitcast double* %arrayidx40.us16.1 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %mul41.us17.1 = fmul <2 x double> %mul41.us17.v.i0.2, %18
  store <2 x double> %mul41.us17.1, <2 x double>* %17, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %arrayidx40.us16.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv104, i64 %indvars.iv.next.1.1
  %19 = bitcast double* %arrayidx40.us16.2.1 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %mul41.us17.2.1 = fmul <2 x double> %mul41.us17.v.i0.2, %20
  store <2 x double> %mul41.us17.2.1, <2 x double>* %19, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.cond34.for.inc65_crit_edge.us.loopexit139.unr-lcssa, label %for.body36.us13

for.cond34.for.inc65_crit_edge.us.loopexit:       ; preds = %for.cond42.for.inc62_crit_edge.us.us
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us.loopexit139.unr-lcssa: ; preds = %for.body36.us13
  br label %for.cond34.for.inc65_crit_edge.us.loopexit139

for.cond34.for.inc65_crit_edge.us.loopexit139:    ; preds = %for.body36.us13.prol.loopexit141, %for.cond34.for.inc65_crit_edge.us.loopexit139.unr-lcssa
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us:                ; preds = %for.cond34.for.inc65_crit_edge.us.loopexit139, %for.cond34.for.inc65_crit_edge.us.loopexit, %for.body36.us13.prol.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 800
  br i1 %exitcond107, label %for.end67.loopexit, label %for.body33.us

for.body36.us.us:                                 ; preds = %for.body36.us.us.preheader, %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.cond42.for.inc62_crit_edge.us.us ], [ 0, %for.body36.us.us.preheader ]
  %arrayidx40.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv104, i64 %indvars.iv101
  %21 = load double, double* %arrayidx40.us.us, align 8
  %mul41.us.us = fmul double %21, %beta
  store double %mul41.us.us, double* %arrayidx40.us.us, align 8
  br i1 true, label %for.body44.us.us.prol.loopexit.unr-lcssa, label %for.body44.us.us.prol.preheader

for.body44.us.us.prol.preheader:                  ; preds = %for.body36.us.us
  %22 = load double, double* %arrayidx48.us.us.prol, align 8
  %arrayidx52.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv101
  %23 = load double, double* %arrayidx52.us.us.prol, align 8
  %mul53.us.us.prol = fmul double %22, %23
  %add58.us.us.prol = fadd double %mul53.us.us.prol, %mul41.us.us
  store double %add58.us.us.prol, double* %arrayidx40.us.us, align 8
  br label %for.body44.us.us.prol.loopexit.unr-lcssa

for.body44.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.body36.us.us, %for.body44.us.us.prol.preheader
  %indvars.iv95.unr.ph = phi i64 [ 1, %for.body44.us.us.prol.preheader ], [ 0, %for.body36.us.us ]
  %.unr.ph = phi double [ %add58.us.us.prol, %for.body44.us.us.prol.preheader ], [ %mul41.us.us, %for.body36.us.us ]
  br i1 false, label %for.cond42.for.inc62_crit_edge.us.us, label %for.body44.us.us.preheader

for.body44.us.us.preheader:                       ; preds = %for.body44.us.us.prol.loopexit.unr-lcssa
  br label %for.body44.us.us

for.cond42.for.inc62_crit_edge.us.us.loopexit:    ; preds = %for.body44.us.us
  br label %for.cond42.for.inc62_crit_edge.us.us

for.cond42.for.inc62_crit_edge.us.us:             ; preds = %for.cond42.for.inc62_crit_edge.us.us.loopexit, %for.body44.us.us.prol.loopexit.unr-lcssa
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond = icmp eq i64 %indvars.iv.next102, 1200
  br i1 %exitcond, label %for.cond34.for.inc65_crit_edge.us.loopexit, label %for.body36.us.us

for.body44.us.us:                                 ; preds = %for.body44.us.us.preheader, %for.body44.us.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %for.body44.us.us ], [ %indvars.iv95.unr.ph, %for.body44.us.us.preheader ]
  %24 = phi double [ %add58.us.us.1, %for.body44.us.us ], [ %.unr.ph, %for.body44.us.us.preheader ]
  %arrayidx48.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv104, i64 %indvars.iv95
  %25 = load double, double* %arrayidx48.us.us, align 8
  %arrayidx52.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv95, i64 %indvars.iv101
  %26 = load double, double* %arrayidx52.us.us, align 8
  %mul53.us.us = fmul double %25, %26
  %add58.us.us = fadd double %mul53.us.us, %24
  store double %add58.us.us, double* %arrayidx40.us.us, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %arrayidx48.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv104, i64 %indvars.iv.next96
  %27 = load double, double* %arrayidx48.us.us.1, align 8
  %arrayidx52.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next96, i64 %indvars.iv101
  %28 = load double, double* %arrayidx52.us.us.1, align 8
  %mul53.us.us.1 = fmul double %27, %28
  %add58.us.us.1 = fadd double %mul53.us.us.1, %add58.us.us
  store double %add58.us.us.1, double* %arrayidx40.us.us, align 8
  %indvars.iv.next96.1 = add nuw nsw i64 %indvars.iv95, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next96.1, 900
  br i1 %exitcond.1, label %for.cond42.for.inc62_crit_edge.us.us.loopexit, label %for.body44.us.us

for.end67.loopexit:                               ; preds = %for.cond34.for.inc65_crit_edge.us
  br label %for.end67

for.end67:                                        ; preds = %for.end67.loopexit, %entry, %for.body33.lr.ph, %for.end30
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1200 x double]* %D) #0 {
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

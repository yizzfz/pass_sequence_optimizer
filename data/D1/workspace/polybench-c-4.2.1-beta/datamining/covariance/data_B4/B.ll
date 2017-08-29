; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %15, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %.preheader

.preheader:                                       ; preds = %32, %4
  %indvars.iv13 = phi i64 [ 0, %4 ], [ %indvars.iv.next14, %32 ]
  %5 = trunc i64 %indvars.iv13 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1.1, %9 ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv
  %13 = trunc i64 %indvars.iv to i32
  %14 = or i32 %13, 1
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %11, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fmul <2 x double> %8, %17
  %19 = fdiv <2 x double> %18, <double 1.200000e+03, double 1.200000e+03>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %21 = trunc i64 %indvars.iv.next.1 to i32
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next.1
  %24 = trunc i64 %indvars.iv.next.1 to i32
  %25 = or i32 %24, 1
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %22, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fmul <2 x double> %8, %28
  %30 = fdiv <2 x double> %29, <double 1.200000e+03, double 1.200000e+03>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next.1.1, 1200
  br i1 %exitcond.1.1, label %32, label %9

; <label>:32:                                     ; preds = %9
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1400
  br i1 %exitcond15, label %33, label %.preheader

; <label>:33:                                     ; preds = %32
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph81, label %.preheader64

.lr.ph81:                                         ; preds = %6
  br i1 true, label %.lr.ph81.split.us.preheader, label %.lr.ph81.split.preheader

.lr.ph81.split.preheader:                         ; preds = %.lr.ph81
  br i1 undef, label %.lr.ph81.split.prol.loopexit, label %.lr.ph81.split.prol.preheader

.lr.ph81.split.prol.preheader:                    ; preds = %.lr.ph81.split.preheader
  br label %.lr.ph81.split.prol

.lr.ph81.split.prol:                              ; preds = %.lr.ph81.split.prol.preheader, %.lr.ph81.split.prol
  br i1 true, label %.lr.ph81.split.prol.loopexit.loopexit, label %.lr.ph81.split.prol, !llvm.loop !1

.lr.ph81.split.prol.loopexit.loopexit:            ; preds = %.lr.ph81.split.prol
  br label %.lr.ph81.split.prol.loopexit

.lr.ph81.split.prol.loopexit:                     ; preds = %.lr.ph81.split.prol.loopexit.loopexit, %.lr.ph81.split.preheader
  br i1 undef, label %.preheader64, label %.lr.ph81.split.preheader143

.lr.ph81.split.preheader143:                      ; preds = %.lr.ph81.split.prol.loopexit
  br i1 undef, label %.lr.ph81.split.prol.preheader198, label %.lr.ph81.split.prol.loopexit199

.lr.ph81.split.prol.preheader198:                 ; preds = %.lr.ph81.split.preheader143
  br label %.lr.ph81.split.prol202

.lr.ph81.split.prol202:                           ; preds = %.lr.ph81.split.prol202, %.lr.ph81.split.prol.preheader198
  br i1 false, label %.lr.ph81.split.prol202, label %.lr.ph81.split.prol.loopexit199.unr-lcssa, !llvm.loop !3

.lr.ph81.split.prol.loopexit199.unr-lcssa:        ; preds = %.lr.ph81.split.prol202
  br label %.lr.ph81.split.prol.loopexit199

.lr.ph81.split.prol.loopexit199:                  ; preds = %.lr.ph81.split.prol.loopexit199.unr-lcssa, %.lr.ph81.split.preheader143
  br i1 undef, label %.preheader64.loopexit193, label %.lr.ph81.split.preheader143.new

.lr.ph81.split.preheader143.new:                  ; preds = %.lr.ph81.split.prol.loopexit199
  br label %.lr.ph81.split

.lr.ph81.split.us.preheader:                      ; preds = %.lr.ph81
  %sunkaddr184 = ptrtoint double* %5 to i64
  %sunkaddr180 = ptrtoint double* %5 to i64
  br label %.lr.ph81.split.us

.lr.ph81.split.us:                                ; preds = %.lr.ph81.split.us.preheader, %._crit_edge78.us
  %indvars.iv104.us = phi i64 [ %indvars.iv.next105.us, %._crit_edge78.us ], [ 0, %.lr.ph81.split.us.preheader ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv104.us
  store double 0.000000e+00, double* %7, align 8
  br i1 true, label %.prol.loopexit134, label %.prol.preheader133.preheader

.prol.preheader133.preheader:                     ; preds = %.lr.ph81.split.us
  br label %.prol.preheader133

.prol.preheader133:                               ; preds = %.prol.preheader133.preheader, %.prol.preheader133
  br i1 true, label %.prol.loopexit134.loopexit, label %.prol.preheader133, !llvm.loop !4

.prol.loopexit134.loopexit:                       ; preds = %.prol.preheader133
  br label %.prol.loopexit134

.prol.loopexit134:                                ; preds = %.prol.loopexit134.loopexit, %.lr.ph81.split.us
  br i1 false, label %._crit_edge78.us, label %.lr.ph81.split.us.new.preheader

.lr.ph81.split.us.new.preheader:                  ; preds = %.prol.loopexit134
  %sunkaddr181 = shl i64 %indvars.iv104.us, 3
  %sunkaddr182 = add i64 %sunkaddr180, %sunkaddr181
  %sunkaddr183 = inttoptr i64 %sunkaddr182 to double*
  br label %.lr.ph81.split.us.new

.lr.ph81.split.us.new:                            ; preds = %.lr.ph81.split.us.new.preheader, %.lr.ph81.split.us.new
  %8 = phi double [ %20, %.lr.ph81.split.us.new ], [ 0.000000e+00, %.lr.ph81.split.us.new.preheader ]
  %indvars.iv100.us = phi i64 [ %indvars.iv.next101.us.3, %.lr.ph81.split.us.new ], [ 0, %.lr.ph81.split.us.new.preheader ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv100.us, i64 %indvars.iv104.us
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %sunkaddr183, align 8
  %indvars.iv.next101.us = or i64 %indvars.iv100.us, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next101.us, i64 %indvars.iv104.us
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr183, align 8
  %indvars.iv.next101.us.1 = or i64 %indvars.iv100.us, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next101.us.1, i64 %indvars.iv104.us
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr183, align 8
  %indvars.iv.next101.us.2 = or i64 %indvars.iv100.us, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next101.us.2, i64 %indvars.iv104.us
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr183, align 8
  %indvars.iv.next101.us.3 = add nuw nsw i64 %indvars.iv100.us, 4
  %exitcond103.us.3 = icmp eq i64 %indvars.iv.next101.us.3, 1400
  br i1 %exitcond103.us.3, label %._crit_edge78.us.loopexit, label %.lr.ph81.split.us.new

._crit_edge78.us.loopexit:                        ; preds = %.lr.ph81.split.us.new
  br label %._crit_edge78.us

._crit_edge78.us:                                 ; preds = %._crit_edge78.us.loopexit, %.prol.loopexit134
  %.lcssa123 = phi double [ undef, %.prol.loopexit134 ], [ %20, %._crit_edge78.us.loopexit ]
  %21 = fdiv double %.lcssa123, %2
  %sunkaddr185 = shl i64 %indvars.iv104.us, 3
  %sunkaddr186 = add i64 %sunkaddr184, %sunkaddr185
  %sunkaddr187 = inttoptr i64 %sunkaddr186 to double*
  store double %21, double* %sunkaddr187, align 8
  %indvars.iv.next105.us = add nuw nsw i64 %indvars.iv104.us, 1
  %exitcond107.us = icmp eq i64 %indvars.iv.next105.us, 1200
  br i1 %exitcond107.us, label %.preheader64.loopexit, label %.lr.ph81.split.us

.preheader64.loopexit:                            ; preds = %._crit_edge78.us
  br label %.preheader64

.preheader64.loopexit193.unr-lcssa:               ; preds = %.lr.ph81.split
  br label %.preheader64.loopexit193

.preheader64.loopexit193:                         ; preds = %.lr.ph81.split.prol.loopexit199, %.preheader64.loopexit193.unr-lcssa
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64.loopexit193, %.preheader64.loopexit, %.lr.ph81.split.prol.loopexit, %6
  br i1 true, label %.preheader63.lr.ph, label %.preheader62

.preheader63.lr.ph:                               ; preds = %.preheader64
  br i1 true, label %.preheader63.us.preheader, label %._crit_edge70

.preheader63.us.preheader:                        ; preds = %.preheader63.lr.ph
  %scevgep161 = getelementptr double, double* %5, i64 1200
  br label %.preheader63.us

.preheader63.us:                                  ; preds = %.preheader63.us.preheader, %._crit_edge73.us
  %indvars.iv96.us = phi i64 [ %indvars.iv.next97.us, %._crit_edge73.us ], [ 0, %.preheader63.us.preheader ]
  br i1 true, label %.prol.loopexit130, label %.prol.preheader129.preheader

.prol.preheader129.preheader:                     ; preds = %.preheader63.us
  br label %.prol.preheader129

.prol.preheader129:                               ; preds = %.prol.preheader129.preheader, %.prol.preheader129
  br i1 true, label %.prol.loopexit130.loopexit, label %.prol.preheader129, !llvm.loop !5

.prol.loopexit130.loopexit:                       ; preds = %.prol.preheader129
  br label %.prol.loopexit130

.prol.loopexit130:                                ; preds = %.prol.loopexit130.loopexit, %.preheader63.us
  br i1 false, label %._crit_edge73.us, label %.preheader63.us.new.preheader

.preheader63.us.new.preheader:                    ; preds = %.prol.loopexit130
  br i1 false, label %.preheader63.us.new.preheader172, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader63.us.new.preheader
  br i1 false, label %.preheader63.us.new.preheader172, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep153 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.us, i64 0
  %scevgep156 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.us, i64 1200
  %bound0 = icmp ult double* %scevgep153, %scevgep161
  %bound1 = icmp ugt double* %scevgep156, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.preheader63.us.new.preheader172, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = shl i64 %index, 2
  %23 = getelementptr inbounds double, double* %5, i64 %22
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %24, align 8, !alias.scope !6
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.us, i64 %22
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec166 = load <8 x double>, <8 x double>* %26, align 8, !alias.scope !9, !noalias !6
  %27 = fsub <8 x double> %wide.vec166, %wide.vec
  %28 = shufflevector <8 x double> %27, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %29 = fsub <8 x double> %wide.vec166, %wide.vec
  %30 = shufflevector <8 x double> %29, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %31 = fsub <8 x double> %wide.vec166, %wide.vec
  %32 = shufflevector <8 x double> %31, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %33 = or i64 %22, 3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.us, i64 %33
  %35 = fsub <8 x double> %wide.vec166, %wide.vec
  %36 = shufflevector <8 x double> %35, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %37 = getelementptr double, double* %34, i64 -3
  %38 = bitcast double* %37 to <8 x double>*
  %39 = shufflevector <2 x double> %28, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %40 = shufflevector <2 x double> %32, <2 x double> %36, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %39, <4 x double> %40, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %38, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 2
  %41 = icmp eq i64 %index.next, 300
  br i1 %41, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge73.us, label %.preheader63.us.new.preheader172

.preheader63.us.new.preheader172:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader63.us.new.preheader
  %indvars.iv92.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader63.us.new.preheader ], [ 1200, %middle.block ]
  br label %.preheader63.us.new

.preheader63.us.new:                              ; preds = %.preheader63.us.new.preheader172, %.preheader63.us.new
  %indvars.iv92.us = phi i64 [ %indvars.iv.next93.us.3, %.preheader63.us.new ], [ %indvars.iv92.us.ph, %.preheader63.us.new.preheader172 ]
  %42 = getelementptr inbounds double, double* %5, i64 %indvars.iv92.us
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.us, i64 %indvars.iv92.us
  %45 = load double, double* %44, align 8
  %46 = fsub double %45, %43
  store double %46, double* %44, align 8
  %indvars.iv.next93.us = or i64 %indvars.iv92.us, 1
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next93.us
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.us, i64 %indvars.iv.next93.us
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %indvars.iv.next93.us.1 = or i64 %indvars.iv92.us, 2
  %52 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next93.us.1
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.us, i64 %indvars.iv.next93.us.1
  %55 = load double, double* %54, align 8
  %56 = fsub double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next93.us.2 = or i64 %indvars.iv92.us, 3
  %57 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next93.us.2
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.us, i64 %indvars.iv.next93.us.2
  %60 = load double, double* %59, align 8
  %61 = fsub double %60, %58
  store double %61, double* %59, align 8
  %indvars.iv.next93.us.3 = add nsw i64 %indvars.iv92.us, 4
  %exitcond95.us.3 = icmp eq i64 %indvars.iv.next93.us.3, 1200
  br i1 %exitcond95.us.3, label %._crit_edge73.us.loopexit, label %.preheader63.us.new, !llvm.loop !14

._crit_edge73.us.loopexit:                        ; preds = %.preheader63.us.new
  br label %._crit_edge73.us

._crit_edge73.us:                                 ; preds = %._crit_edge73.us.loopexit, %middle.block, %.prol.loopexit130
  %indvars.iv.next97.us = add nuw nsw i64 %indvars.iv96.us, 1
  %exitcond99.us = icmp eq i64 %indvars.iv.next97.us, 1400
  br i1 %exitcond99.us, label %.preheader62.loopexit, label %.preheader63.us

.lr.ph81.split:                                   ; preds = %.lr.ph81.split, %.lr.ph81.split.preheader143.new
  br i1 true, label %.preheader64.loopexit193.unr-lcssa, label %.lr.ph81.split

.preheader62.loopexit:                            ; preds = %._crit_edge73.us
  br label %.preheader62

.preheader62:                                     ; preds = %.preheader62.loopexit, %.preheader64
  br i1 true, label %.preheader.lr.ph, label %._crit_edge70

.preheader.lr.ph:                                 ; preds = %.preheader62
  %62 = fadd double %2, -1.000000e+00
  br i1 true, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge68.us-lcssa.us.us
  %indvars.iv88.us = phi i64 [ %indvars.iv.next89.us, %._crit_edge68.us-lcssa.us.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader.us
  %indvars.iv84.us.us = phi i64 [ %indvars.iv88.us, %.preheader.us ], [ %indvars.iv.next85.us.us, %._crit_edge.us.us ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv88.us, i64 %indvars.iv84.us.us
  store double 0.000000e+00, double* %63, align 8
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.us.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 false, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %.lcssa = phi double [ undef, %.prol.loopexit ], [ %78, %._crit_edge.us.us.loopexit ]
  %64 = fdiv double %.lcssa, %62
  store double %64, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv84.us.us, i64 %indvars.iv88.us
  store double %64, double* %65, align 8
  %indvars.iv.next85.us.us = add nuw nsw i64 %indvars.iv84.us.us, 1
  %exitcond87.us.us = icmp eq i64 %indvars.iv.next85.us.us, 1200
  br i1 %exitcond87.us.us, label %._crit_edge68.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %66 = phi double [ %78, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us.new.preheader ]
  %indvars.iv.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ %indvars.iv.us.us.unr.ph, %.lr.ph.us.us.new.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.us.us, i64 %indvars.iv88.us
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.us.us, i64 %indvars.iv84.us.us
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %63, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv.us.us, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv88.us
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.us.us, i64 %indvars.iv84.us.us
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %72, %77
  store double %78, double* %63, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv.us.us, 2
  %exitcond.us.us.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.us.us.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge68.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %indvars.iv.next89.us = add nuw nsw i64 %indvars.iv88.us, 1
  %exitcond91.us = icmp eq i64 %indvars.iv.next89.us, 1200
  br i1 %exitcond91.us, label %._crit_edge70.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge68
  br i1 undef, label %.prol.loopexit126, label %.prol.preheader125

.prol.preheader125:                               ; preds = %.preheader
  br label %.prol.loopexit126

.prol.loopexit126:                                ; preds = %.prol.preheader125, %.preheader
  br i1 undef, label %._crit_edge68, label %.preheader.new.preheader

.preheader.new.preheader:                         ; preds = %.prol.loopexit126
  br i1 undef, label %.preheader.new.prol.preheader, label %.preheader.new.prol.loopexit.unr-lcssa

.preheader.new.prol.preheader:                    ; preds = %.preheader.new.preheader
  br label %.preheader.new.prol

.preheader.new.prol:                              ; preds = %.preheader.new.prol.preheader
  br label %.preheader.new.prol.loopexit.unr-lcssa

.preheader.new.prol.loopexit.unr-lcssa:           ; preds = %.preheader.new.preheader, %.preheader.new.prol
  br label %.preheader.new.prol.loopexit

.preheader.new.prol.loopexit:                     ; preds = %.preheader.new.prol.loopexit.unr-lcssa
  br i1 undef, label %._crit_edge68.loopexit, label %.preheader.new.preheader.new

.preheader.new.preheader.new:                     ; preds = %.preheader.new.prol.loopexit
  br label %.preheader.new

.preheader.new:                                   ; preds = %.preheader.new, %.preheader.new.preheader.new
  br i1 true, label %._crit_edge68.loopexit.unr-lcssa, label %.preheader.new

._crit_edge68.loopexit.unr-lcssa:                 ; preds = %.preheader.new
  br label %._crit_edge68.loopexit

._crit_edge68.loopexit:                           ; preds = %.preheader.new.prol.loopexit, %._crit_edge68.loopexit.unr-lcssa
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68.loopexit, %.prol.loopexit126
  br i1 true, label %._crit_edge70.loopexit192, label %.preheader

._crit_edge70.loopexit:                           ; preds = %._crit_edge68.us-lcssa.us.us
  br label %._crit_edge70

._crit_edge70.loopexit192:                        ; preds = %._crit_edge68
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.loopexit192, %._crit_edge70.loopexit, %.preheader63.lr.ph, %.preheader62
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %2
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.lr.ph
  %indvars.iv16 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next17, %._crit_edge ]
  %7 = mul i64 %indvars.iv16, 1200
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %15 ]
  %9 = add i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %8

._crit_edge:                                      ; preds = %15
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond19, label %._crit_edge15.loopexit, label %.preheader

._crit_edge15.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}

; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  %11 = bitcast i8* %5 to [1200 x double]*
  %12 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %11, [1000 x double]* %12)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1200, [1200 x double]* %11)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader5.lr.ph, label %.preheader4.thread

.preheader5.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %0 to double
  br i1 %8, label %.preheader5.us.preheader, label %.preheader.lr.ph

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge13.us, %.preheader5.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next36, %._crit_edge13.us ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader5.us
  %indvars.iv26 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next27, %12 ]
  %13 = mul nsw i64 %indvars.iv26, %indvars.iv35
  %14 = add nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %9
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv35, i64 %indvars.iv26
  store double %18, double* %19, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %20 = icmp slt i64 %indvars.iv.next27, %10
  br i1 %20, label %12, label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %12
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %21 = icmp slt i64 %indvars.iv.next36, %11
  br i1 %21, label %.preheader5.us, label %.preheader.lr.ph.loopexit

.preheader.lr.ph.loopexit:                        ; preds = %._crit_edge13.us
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.loopexit, %.preheader5.lr.ph
  %22 = sitofp i32 %1 to double
  %23 = sext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv32 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next33, %._crit_edge.us ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %24 ]
  %25 = mul nsw i64 %indvars.iv, %indvars.iv32
  %26 = add nsw i64 %25, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %22
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv32, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = icmp slt i64 %indvars.iv.next, %23
  br i1 %32, label %24, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %24
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %33 = icmp slt i64 %indvars.iv.next33, %23
  br i1 %33, label %.preheader.us, label %.preheader4.thread.loopexit

.preheader4.thread.loopexit:                      ; preds = %._crit_edge.us
  br label %.preheader4.thread

.preheader4.thread:                               ; preds = %.preheader4.thread.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader5.lr.ph, label %._crit_edge

.preheader5.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %9 = sext i32 %0 to i64
  %broadcast.splatinsert97 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat98 = shufflevector <2 x double> %broadcast.splatinsert97, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %broadcast.splatinsert122 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat123 = shufflevector <2 x double> %broadcast.splatinsert122, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv90 = phi i2 [ 1, %.preheader5.us.preheader ], [ %indvars.iv.next91, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv77 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next78, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv70 = phi i32 [ 1, %.preheader5.us.preheader ], [ %indvars.iv.next71, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv53 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next54, %._crit_edge9.us..preheader5.us_crit_edge ]
  %12 = add i64 %indvars.iv77, 1
  %13 = and i64 %12, 4294967295
  %14 = zext i2 %indvars.iv90 to i64
  %15 = trunc i64 %indvars.iv77 to i32
  %16 = add i32 %15, 1
  %17 = zext i32 %indvars.iv70 to i64
  %18 = zext i32 %16 to i64
  %19 = add nsw i64 %18, -1
  %20 = icmp slt i64 %indvars.iv53, 0
  br i1 %20, label %._crit_edge9.us, label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader ]
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %3
  store double %23, double* %21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %3
  store double %26, double* %24, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %3
  store double %29, double* %27, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next.2
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %3
  store double %32, double* %30, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond69.3 = icmp eq i64 %indvars.iv.next.3, %17
  br i1 %exitcond69.3, label %.preheader.us22.preheader.loopexit, label %.lr.ph.us.new, !llvm.loop !1

.preheader.us22.new:                              ; preds = %.preheader.us22.new.preheader, %.preheader.us22.new
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %.preheader.us22.new ], [ %indvars.iv41.unr.ph, %.preheader.us22.new.preheader ]
  %33 = load double, double* %49, align 8
  %34 = fmul double %33, %2
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv49
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  store double %40, double* %38, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %41 = load double, double* %49, align 8
  %42 = fmul double %41, %2
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next42, i64 %indvars.iv49
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  store double %48, double* %46, align 8
  %indvars.iv.next42.1 = add nuw nsw i64 %indvars.iv41, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next42.1, %17
  br i1 %exitcond.1, label %._crit_edge.us24.loopexit, label %.preheader.us22.new

.preheader.us22:                                  ; preds = %._crit_edge.us24, %.preheader.us22.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge.us24 ], [ 0, %.preheader.us22.preheader ]
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv49
  br i1 %lcmp.mod75, label %.prol.loopexit73, label %.prol.preheader72

.prol.preheader72:                                ; preds = %.preheader.us22
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %2
  %52 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv49
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %85, align 8
  %56 = fadd double %54, %55
  store double %56, double* %85, align 8
  br label %.prol.loopexit73

.prol.loopexit73:                                 ; preds = %.preheader.us22, %.prol.preheader72
  %indvars.iv41.unr.ph = phi i64 [ 1, %.prol.preheader72 ], [ 0, %.preheader.us22 ]
  br i1 %84, label %._crit_edge.us24, label %.preheader.us22.new.preheader

.preheader.us22.new.preheader:                    ; preds = %.prol.loopexit73
  br label %.preheader.us22.new

.lr.ph.us:                                        ; preds = %.preheader5.us
  %xtraiter = and i64 %18, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.prol
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %3
  store double %59, double* %57, align 8
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !5

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %14, %.prol.loopexit.loopexit ]
  %60 = icmp ult i64 %19, 3
  br i1 %60, label %.preheader.us22.preheader, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  %61 = add nsw i64 %13, -4
  %62 = sub nsw i64 %61, %indvars.iv.unr
  %63 = lshr i64 %62, 2
  %64 = add nuw nsw i64 %63, 1
  %min.iters.check102 = icmp ult i64 %64, 2
  br i1 %min.iters.check102, label %.lr.ph.us.new.preheader, label %min.iters.checked103

.lr.ph.us.new.preheader:                          ; preds = %middle.block100, %min.iters.checked103, %.prol.loopexit..lr.ph.us.new_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked103 ], [ %indvars.iv.unr, %.prol.loopexit..lr.ph.us.new_crit_edge ], [ %ind.end111, %middle.block100 ]
  br label %.lr.ph.us.new

min.iters.checked103:                             ; preds = %.prol.loopexit..lr.ph.us.new_crit_edge
  %n.mod.vf104 = and i64 %64, 1
  %n.vec105 = sub nsw i64 %64, %n.mod.vf104
  %cmp.zero106 = icmp eq i64 %n.vec105, 0
  %65 = or i64 %indvars.iv.unr, 4
  %66 = shl nuw i64 %63, 2
  %67 = add i64 %65, %66
  %68 = shl nuw nsw i64 %n.mod.vf104, 2
  %ind.end111 = sub i64 %67, %68
  br i1 %cmp.zero106, label %.lr.ph.us.new.preheader, label %vector.ph107

vector.ph107:                                     ; preds = %min.iters.checked103
  br label %vector.body99

vector.body99:                                    ; preds = %vector.body99, %vector.ph107
  %index108 = phi i64 [ 0, %vector.ph107 ], [ %index.next109, %vector.body99 ]
  %69 = shl i64 %index108, 2
  %offset.idx113 = or i64 %indvars.iv.unr, %69
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %offset.idx113
  %71 = bitcast double* %70 to <8 x double>*
  %wide.vec117 = load <8 x double>, <8 x double>* %71, align 8
  %strided.vec118 = shufflevector <8 x double> %wide.vec117, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec119 = shufflevector <8 x double> %wide.vec117, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec120 = shufflevector <8 x double> %wide.vec117, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec121 = shufflevector <8 x double> %wide.vec117, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %72 = fmul <2 x double> %strided.vec118, %broadcast.splat123
  %73 = fmul <2 x double> %strided.vec119, %broadcast.splat123
  %74 = fmul <2 x double> %strided.vec120, %broadcast.splat123
  %75 = add nsw i64 %offset.idx113, 3
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %75
  %77 = fmul <2 x double> %strided.vec121, %broadcast.splat123
  %78 = getelementptr double, double* %76, i64 -3
  %79 = bitcast double* %78 to <8 x double>*
  %80 = shufflevector <2 x double> %72, <2 x double> %73, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %81 = shufflevector <2 x double> %74, <2 x double> %77, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec124 = shufflevector <4 x double> %80, <4 x double> %81, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec124, <8 x double>* %79, align 8
  %index.next109 = add i64 %index108, 2
  %82 = icmp eq i64 %index.next109, %n.vec105
  br i1 %82, label %middle.block100, label %vector.body99, !llvm.loop !7

middle.block100:                                  ; preds = %vector.body99
  %cmp.n112 = icmp eq i64 %n.mod.vf104, 0
  br i1 %cmp.n112, label %.preheader.us22.preheader, label %.lr.ph.us.new.preheader

._crit_edge.us24.loopexit:                        ; preds = %.preheader.us22.new
  br label %._crit_edge.us24

._crit_edge.us24:                                 ; preds = %._crit_edge.us24.loopexit, %.prol.loopexit73
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond = icmp eq i64 %indvars.iv.next50, %10
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us22

.preheader.us22.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us22.preheader

.preheader.us22.preheader:                        ; preds = %.preheader.us22.preheader.loopexit, %middle.block100, %.prol.loopexit
  %83 = and i32 %16, 1
  %lcmp.mod75 = icmp eq i32 %83, 0
  %84 = icmp eq i32 %15, 0
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 0
  br label %.preheader.us22

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us24
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %.preheader5.us
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, 1
  %86 = icmp slt i64 %indvars.iv.next54, %11
  br i1 %86, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge.loopexit

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  %indvars.iv.next91 = add i2 %indvars.iv90, 1
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %indvars.iv.next71 = add i32 %indvars.iv70, 1
  br label %.preheader5.us

.preheader5:                                      ; preds = %.preheader4..preheader5_crit_edge, %.preheader5.preheader
  %indvars.iv92 = phi i2 [ 1, %.preheader5.preheader ], [ %indvars.iv.next93, %.preheader4..preheader5_crit_edge ]
  %indvars.iv87 = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next88, %.preheader4..preheader5_crit_edge ]
  %indvars.iv79 = phi i32 [ 1, %.preheader5.preheader ], [ %indvars.iv.next80, %.preheader4..preheader5_crit_edge ]
  %indvars.iv64 = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next65, %.preheader4..preheader5_crit_edge ]
  %87 = add i64 %indvars.iv87, 1
  %88 = and i64 %87, 4294967295
  %89 = zext i2 %indvars.iv92 to i64
  %90 = add i64 %indvars.iv87, 1
  %91 = and i64 %90, 4294967295
  %92 = add nsw i64 %91, -1
  %93 = zext i32 %indvars.iv79 to i64
  %94 = icmp slt i64 %indvars.iv64, 0
  br i1 %94, label %.preheader4, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader5
  %xtraiter84 = and i64 %90, 3
  %lcmp.mod85 = icmp eq i64 %xtraiter84, 0
  br i1 %lcmp.mod85, label %.prol.loopexit83, label %.prol.preheader82.preheader

.prol.preheader82.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader82

.prol.preheader82:                                ; preds = %.prol.preheader82.preheader, %.prol.preheader82
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %.prol.preheader82 ], [ 0, %.prol.preheader82.preheader ]
  %prol.iter86 = phi i64 [ %prol.iter86.sub, %.prol.preheader82 ], [ %xtraiter84, %.prol.preheader82.preheader ]
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv56.prol
  %96 = load double, double* %95, align 8
  %97 = fmul double %96, %3
  store double %97, double* %95, align 8
  %prol.iter86.sub = add nsw i64 %prol.iter86, -1
  %prol.iter86.cmp = icmp eq i64 %prol.iter86.sub, 0
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  br i1 %prol.iter86.cmp, label %.prol.loopexit83.loopexit, label %.prol.preheader82, !llvm.loop !8

.prol.loopexit83.loopexit:                        ; preds = %.prol.preheader82
  br label %.prol.loopexit83

.prol.loopexit83:                                 ; preds = %.prol.loopexit83.loopexit, %.lr.ph
  %indvars.iv56.unr = phi i64 [ 0, %.lr.ph ], [ %89, %.prol.loopexit83.loopexit ]
  %98 = icmp ult i64 %92, 3
  br i1 %98, label %.preheader4, label %.prol.loopexit83..lr.ph.new_crit_edge

.prol.loopexit83..lr.ph.new_crit_edge:            ; preds = %.prol.loopexit83
  %99 = add nsw i64 %88, -4
  %100 = sub nsw i64 %99, %indvars.iv56.unr
  %101 = lshr i64 %100, 2
  %102 = add nuw nsw i64 %101, 1
  %min.iters.check = icmp ult i64 %102, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.prol.loopexit83..lr.ph.new_crit_edge
  %n.mod.vf = and i64 %102, 1
  %n.vec = sub nsw i64 %102, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %103 = or i64 %indvars.iv56.unr, 4
  %104 = shl nuw i64 %101, 2
  %105 = add i64 %103, %104
  %106 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %105, %106
  br i1 %cmp.zero, label %.lr.ph.new.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %107 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv56.unr, %107
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %offset.idx
  %109 = bitcast double* %108 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %109, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec94 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec95 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec96 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %110 = fmul <2 x double> %strided.vec, %broadcast.splat98
  %111 = fmul <2 x double> %strided.vec94, %broadcast.splat98
  %112 = fmul <2 x double> %strided.vec95, %broadcast.splat98
  %113 = add nsw i64 %offset.idx, 3
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %113
  %115 = fmul <2 x double> %strided.vec96, %broadcast.splat98
  %116 = getelementptr double, double* %114, i64 -3
  %117 = bitcast double* %116 to <8 x double>*
  %118 = shufflevector <2 x double> %110, <2 x double> %111, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %119 = shufflevector <2 x double> %112, <2 x double> %115, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %118, <4 x double> %119, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %117, align 8
  %index.next = add i64 %index, 2
  %120 = icmp eq i64 %index.next, %n.vec
  br i1 %120, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader4, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %middle.block, %min.iters.checked, %.prol.loopexit83..lr.ph.new_crit_edge
  %indvars.iv56.ph = phi i64 [ %indvars.iv56.unr, %min.iters.checked ], [ %indvars.iv56.unr, %.prol.loopexit83..lr.ph.new_crit_edge ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.3, %.lr.ph.new ], [ %indvars.iv56.ph, %.lr.ph.new.preheader ]
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv56
  %122 = load double, double* %121, align 8
  %123 = fmul double %122, %3
  store double %123, double* %121, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv.next57
  %125 = load double, double* %124, align 8
  %126 = fmul double %125, %3
  store double %126, double* %124, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv.next57.1
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, %3
  store double %129, double* %127, align 8
  %indvars.iv.next57.2 = add nsw i64 %indvars.iv56, 3
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv64, i64 %indvars.iv.next57.2
  %131 = load double, double* %130, align 8
  %132 = fmul double %131, %3
  store double %132, double* %130, align 8
  %indvars.iv.next57.3 = add nuw nsw i64 %indvars.iv56, 4
  %exitcond81.3 = icmp eq i64 %indvars.iv.next57.3, %93
  br i1 %exitcond81.3, label %.preheader4.loopexit, label %.lr.ph.new, !llvm.loop !10

.preheader4.loopexit:                             ; preds = %.lr.ph.new
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block, %.prol.loopexit83, %.preheader5
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %133 = icmp slt i64 %indvars.iv.next65, %9
  br i1 %133, label %.preheader4..preheader5_crit_edge, label %._crit_edge.loopexit125

.preheader4..preheader5_crit_edge:                ; preds = %.preheader4
  %indvars.iv.next93 = add i2 %indvars.iv92, 1
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %indvars.iv.next80 = add i32 %indvars.iv79, 1
  br label %.preheader5

._crit_edge.loopexit:                             ; preds = %._crit_edge9.us
  br label %._crit_edge

._crit_edge.loopexit125:                          ; preds = %.preheader4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit125, %._crit_edge.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next10, %._crit_edge.us ]
  %9 = mul nsw i64 %8, %indvars.iv9
  br label %10

; <label>:10:                                     ; preds = %._crit_edge13, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %11 = add i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge13

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = icmp slt i64 %indvars.iv.next, %8
  br i1 %21, label %10, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %22 = icmp slt i64 %indvars.iv.next10, %8
  br i1 %22, label %.preheader.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}

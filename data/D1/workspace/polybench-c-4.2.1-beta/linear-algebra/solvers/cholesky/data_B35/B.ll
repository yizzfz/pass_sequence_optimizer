; ModuleID = 'A.ll'
source_filename = "cholesky.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %9, %2
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader74.lr.ph, label %._crit_edge93.thread

._crit_edge93.thread:                             ; preds = %2
  %4 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge77

.preheader74.lr.ph:                               ; preds = %2
  %5 = sitofp i32 %0 to double
  %6 = sext i32 %0 to i64
  %7 = zext i32 %0 to i64
  %8 = shl nuw nsw i64 %7, 3
  %9 = add nsw i64 %8, -8
  br label %.lr.ph89

.lr.ph89:                                         ; preds = %.preheader74.lr.ph, %._crit_edge91
  %indvars.iv141 = phi i64 [ 0, %.preheader74.lr.ph ], [ %indvars.iv.next142, %._crit_edge91 ]
  %indvars.iv139 = phi i64 [ 1, %.preheader74.lr.ph ], [ %indvars.iv.next140, %._crit_edge91 ]
  %10 = mul i64 %indvars.iv141, 2001
  %11 = add i64 %10, 1
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %11
  %12 = mul i64 %indvars.iv141, -8
  br label %14

.preheader73:                                     ; preds = %14
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %13 = icmp slt i64 %indvars.iv.next142, %6
  br i1 %13, label %._crit_edge91.loopexit, label %._crit_edge91

; <label>:14:                                     ; preds = %14, %.lr.ph89
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %14 ], [ 0, %.lr.ph89 ]
  %15 = sub nsw i64 0, %indvars.iv127
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %5
  %20 = fadd double %19, 1.000000e+00
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv127
  store double %20, double* %21, align 8
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next128, %indvars.iv139
  br i1 %exitcond132, label %.preheader73, label %14

._crit_edge91.loopexit:                           ; preds = %.preheader73
  %22 = add i64 %9, %12
  %scevgep160161 = bitcast double* %scevgep160 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep160161, i8 0, i64 %22, i32 8, i1 false)
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge91.loopexit, %.preheader73
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv141, i64 %indvars.iv141
  store double 1.000000e+00, double* %23, align 8
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next142, %7
  br i1 %exitcond162, label %._crit_edge93, label %.lr.ph89

._crit_edge93:                                    ; preds = %._crit_edge91
  %24 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %25 = icmp sgt i32 %0, 0
  br i1 %25, label %.preheader72.lr.ph, label %._crit_edge77

.preheader72.lr.ph:                               ; preds = %._crit_edge93
  %26 = zext i32 %0 to i64
  %27 = shl nuw nsw i64 %26, 3
  %28 = zext i32 %0 to i64
  %29 = add nsw i64 %28, -1
  %xtraiter156 = and i64 %28, 3
  %lcmp.mod157 = icmp eq i64 %xtraiter156, 0
  br i1 %lcmp.mod157, label %.preheader72.us.prol.loopexit, label %._crit_edge86.us.prol.preheader

._crit_edge86.us.prol.preheader:                  ; preds = %.preheader72.lr.ph
  br label %._crit_edge86.us.prol

._crit_edge86.us.prol:                            ; preds = %._crit_edge86.us.prol.preheader, %._crit_edge86.us.prol
  %indvars.iv123.prol = phi i64 [ %indvars.iv.next124.prol, %._crit_edge86.us.prol ], [ 0, %._crit_edge86.us.prol.preheader ]
  %prol.iter158 = phi i64 [ %prol.iter158.sub, %._crit_edge86.us.prol ], [ %xtraiter156, %._crit_edge86.us.prol.preheader ]
  %30 = mul nuw nsw i64 %indvars.iv123.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %24, i64 %30
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %27, i32 8, i1 false)
  %indvars.iv.next124.prol = add nuw nsw i64 %indvars.iv123.prol, 1
  %prol.iter158.sub = add nsw i64 %prol.iter158, -1
  %prol.iter158.cmp = icmp eq i64 %prol.iter158.sub, 0
  br i1 %prol.iter158.cmp, label %.preheader72.us.prol.loopexit.loopexit, label %._crit_edge86.us.prol, !llvm.loop !1

.preheader72.us.prol.loopexit.loopexit:           ; preds = %._crit_edge86.us.prol
  br label %.preheader72.us.prol.loopexit

.preheader72.us.prol.loopexit:                    ; preds = %.preheader72.us.prol.loopexit.loopexit, %.preheader72.lr.ph
  %indvars.iv123.unr = phi i64 [ 0, %.preheader72.lr.ph ], [ %xtraiter156, %.preheader72.us.prol.loopexit.loopexit ]
  %31 = icmp ult i64 %29, 3
  br i1 %31, label %.preheader71, label %._crit_edge86.us.3.preheader

._crit_edge86.us.3.preheader:                     ; preds = %.preheader72.us.prol.loopexit
  %32 = add nsw i64 %28, -4
  %33 = sub nsw i64 %32, %indvars.iv123.unr
  %34 = lshr i64 %33, 2
  %35 = and i64 %34, 1
  %lcmp.mod165 = icmp eq i64 %35, 0
  br i1 %lcmp.mod165, label %._crit_edge86.us.3.prol.preheader, label %._crit_edge86.us.3.prol.loopexit

._crit_edge86.us.3.prol.preheader:                ; preds = %._crit_edge86.us.3.preheader
  br label %._crit_edge86.us.3.prol

._crit_edge86.us.3.prol:                          ; preds = %._crit_edge86.us.3.prol.preheader
  %36 = mul nuw nsw i64 %indvars.iv123.unr, 16000
  %scevgep.prol167 = getelementptr i8, i8* %24, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol167, i8 0, i64 %27, i32 8, i1 false)
  %37 = mul nuw nsw i64 %indvars.iv123.unr, 16000
  %38 = add nuw nsw i64 %37, 16000
  %scevgep.1.prol = getelementptr i8, i8* %24, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %27, i32 8, i1 false)
  %39 = mul nuw nsw i64 %indvars.iv123.unr, 16000
  %40 = add nuw nsw i64 %39, 32000
  %scevgep.2.prol = getelementptr i8, i8* %24, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %27, i32 8, i1 false)
  %41 = mul nuw nsw i64 %indvars.iv123.unr, 16000
  %42 = add nuw nsw i64 %41, 48000
  %scevgep.3.prol = getelementptr i8, i8* %24, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %27, i32 8, i1 false)
  %indvars.iv.next124.3.prol = or i64 %indvars.iv123.unr, 4
  br label %._crit_edge86.us.3.prol.loopexit

._crit_edge86.us.3.prol.loopexit:                 ; preds = %._crit_edge86.us.3.prol, %._crit_edge86.us.3.preheader
  %indvars.iv123.unr168 = phi i64 [ %indvars.iv123.unr, %._crit_edge86.us.3.preheader ], [ %indvars.iv.next124.3.prol, %._crit_edge86.us.3.prol ]
  %43 = icmp eq i64 %34, 0
  br i1 %43, label %.preheader71.loopexit, label %._crit_edge86.us.3.preheader.new

._crit_edge86.us.3.preheader.new:                 ; preds = %._crit_edge86.us.3.prol.loopexit
  br label %._crit_edge86.us.3

.preheader71.loopexit.unr-lcssa:                  ; preds = %._crit_edge86.us.3
  br label %.preheader71.loopexit

.preheader71.loopexit:                            ; preds = %._crit_edge86.us.3.prol.loopexit, %.preheader71.loopexit.unr-lcssa
  br label %.preheader71

.preheader71:                                     ; preds = %.preheader71.loopexit, %.preheader72.us.prol.loopexit
  %44 = icmp sgt i32 %0, 0
  br i1 %44, label %.preheader70.lr.ph, label %._crit_edge77

.preheader70.lr.ph:                               ; preds = %.preheader71
  %45 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %46 = zext i32 %0 to i64
  %xtraiter150 = and i64 %46, 1
  %lcmp.mod151 = icmp eq i64 %xtraiter150, 0
  %47 = icmp eq i32 %0, 1
  br label %.preheader69.us.us.preheader

.preheader69.us.us.preheader:                     ; preds = %.preheader70.lr.ph, %._crit_edge82.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge82.us ], [ 0, %.preheader70.lr.ph ]
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv115
  br label %.preheader69.us.us

._crit_edge82.us:                                 ; preds = %._crit_edge80.us.us
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next116, %46
  br i1 %exitcond153, label %.preheader68, label %.preheader69.us.us.preheader

.preheader69.us.us:                               ; preds = %._crit_edge80.us.us, %.preheader69.us.us.preheader
  %indvars.iv111 = phi i64 [ 0, %.preheader69.us.us.preheader ], [ %indvars.iv.next112, %._crit_edge80.us.us ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv111, i64 %indvars.iv115
  br i1 %lcmp.mod151, label %.prol.loopexit149, label %.prol.preheader148

.prol.preheader148:                               ; preds = %.preheader69.us.us
  %50 = load double, double* %49, align 8
  %51 = load double, double* %48, align 8
  %52 = fmul double %50, %51
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv111, i64 0
  %54 = load double, double* %53, align 8
  %55 = fadd double %54, %52
  store double %55, double* %53, align 8
  br label %.prol.loopexit149

.prol.loopexit149:                                ; preds = %.prol.preheader148, %.preheader69.us.us
  %indvars.iv107.unr.ph = phi i64 [ 1, %.prol.preheader148 ], [ 0, %.preheader69.us.us ]
  br i1 %47, label %._crit_edge80.us.us, label %.preheader69.us.us.new.preheader

.preheader69.us.us.new.preheader:                 ; preds = %.prol.loopexit149
  br label %.preheader69.us.us.new

._crit_edge80.us.us.loopexit:                     ; preds = %.preheader69.us.us.new
  br label %._crit_edge80.us.us

._crit_edge80.us.us:                              ; preds = %._crit_edge80.us.us.loopexit, %.prol.loopexit149
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond152 = icmp eq i64 %indvars.iv.next112, %46
  br i1 %exitcond152, label %._crit_edge82.us, label %.preheader69.us.us

.preheader69.us.us.new:                           ; preds = %.preheader69.us.us.new.preheader, %.preheader69.us.us.new
  %indvars.iv107 = phi i64 [ %indvars.iv.next108.1, %.preheader69.us.us.new ], [ %indvars.iv107.unr.ph, %.preheader69.us.us.new.preheader ]
  %56 = load double, double* %49, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv107, i64 %indvars.iv115
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv111, i64 %indvars.iv107
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %60, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %63 = load double, double* %49, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next108, i64 %indvars.iv115
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %45, i64 0, i64 %indvars.iv111, i64 %indvars.iv.next108
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %indvars.iv.next108.1 = add nuw nsw i64 %indvars.iv107, 2
  %exitcond147.1 = icmp eq i64 %indvars.iv.next108.1, %46
  br i1 %exitcond147.1, label %._crit_edge80.us.us.loopexit, label %.preheader69.us.us.new

.preheader68:                                     ; preds = %._crit_edge82.us
  %70 = icmp sgt i32 %0, 0
  br i1 %70, label %.preheader.lr.ph, label %._crit_edge77

.preheader.lr.ph:                                 ; preds = %.preheader68
  %71 = bitcast i8* %24 to [2000 x [2000 x double]]*
  %72 = zext i32 %0 to i64
  %73 = add nsw i64 %72, -1
  %xtraiter = and i64 %72, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %74 = icmp ult i64 %73, 3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv102, i64 %indvars.iv.prol
  %76 = bitcast double* %75 to i64*
  %77 = load i64, i64* %76, align 8
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.prol
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us ], [ %xtraiter, %.prol.loopexit.loopexit ]
  br i1 %74, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv102, i64 %indvars.iv
  %81 = bitcast double* %80 to i64*
  %82 = load i64, i64* %81, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next
  %86 = bitcast double* %85 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %90 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next.1
  %91 = bitcast double* %90 to i64*
  %92 = load i64, i64* %91, align 8
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next.1
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv102, i64 %indvars.iv.next.2
  %96 = bitcast double* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv102, i64 %indvars.iv.next.2
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond145.3 = icmp eq i64 %indvars.iv.next.3, %72
  br i1 %exitcond145.3, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond = icmp eq i64 %indvars.iv.next103, %72
  br i1 %exitcond, label %._crit_edge77.loopexit, label %.preheader.us

._crit_edge77.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge77

._crit_edge77:                                    ; preds = %._crit_edge77.loopexit, %._crit_edge93, %._crit_edge93.thread, %.preheader71, %.preheader68
  %100 = phi i8* [ %24, %.preheader68 ], [ %24, %.preheader71 ], [ %24, %._crit_edge93 ], [ %4, %._crit_edge93.thread ], [ %24, %._crit_edge77.loopexit ]
  tail call void @free(i8* %100) #3
  ret void

._crit_edge86.us.3:                               ; preds = %._crit_edge86.us.3, %._crit_edge86.us.3.preheader.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr168, %._crit_edge86.us.3.preheader.new ], [ %indvars.iv.next124.3.1, %._crit_edge86.us.3 ]
  %101 = mul nuw nsw i64 %indvars.iv123, 16000
  %scevgep = getelementptr i8, i8* %24, i64 %101
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %27, i32 8, i1 false)
  %102 = mul i64 %indvars.iv123, 16000
  %103 = add i64 %102, 16000
  %scevgep.1 = getelementptr i8, i8* %24, i64 %103
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %27, i32 8, i1 false)
  %104 = mul i64 %indvars.iv123, 16000
  %105 = add i64 %104, 32000
  %scevgep.2 = getelementptr i8, i8* %24, i64 %105
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %27, i32 8, i1 false)
  %106 = mul i64 %indvars.iv123, 16000
  %107 = add i64 %106, 48000
  %scevgep.3 = getelementptr i8, i8* %24, i64 %107
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %27, i32 8, i1 false)
  %indvars.iv.next124.3 = add nsw i64 %indvars.iv123, 4
  %108 = mul nuw nsw i64 %indvars.iv.next124.3, 16000
  %scevgep.1169 = getelementptr i8, i8* %24, i64 %108
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1169, i8 0, i64 %27, i32 8, i1 false)
  %109 = mul i64 %indvars.iv.next124.3, 16000
  %110 = add i64 %109, 16000
  %scevgep.1.1 = getelementptr i8, i8* %24, i64 %110
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %27, i32 8, i1 false)
  %111 = mul i64 %indvars.iv.next124.3, 16000
  %112 = add i64 %111, 32000
  %scevgep.2.1 = getelementptr i8, i8* %24, i64 %112
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %27, i32 8, i1 false)
  %113 = mul i64 %indvars.iv.next124.3, 16000
  %114 = add i64 %113, 48000
  %scevgep.3.1 = getelementptr i8, i8* %24, i64 %114
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %27, i32 8, i1 false)
  %indvars.iv.next124.3.1 = add nsw i64 %indvars.iv123, 8
  %exitcond155.3.1 = icmp eq i64 %indvars.iv.next124.3.1, %28
  br i1 %exitcond155.3.1, label %.preheader71.loopexit.unr-lcssa, label %._crit_edge86.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader44.preheader, label %._crit_edge51

.preheader44.preheader:                           ; preds = %2
  %4 = zext i32 %0 to i64
  br label %.preheader44

.preheader44:                                     ; preds = %._crit_edge49, %.preheader44.preheader
  %indvars.iv65 = phi i64 [ 0, %.preheader44.preheader ], [ %indvars.iv.next66, %._crit_edge49 ]
  %5 = add i64 %indvars.iv65, -2
  %6 = icmp sgt i64 %indvars.iv65, 0
  br i1 %6, label %.preheader.preheader, label %._crit_edge49

.preheader.preheader:                             ; preds = %.preheader44
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 0
  br label %.preheader

.preheader43:                                     ; preds = %._crit_edge
  %8 = icmp sgt i64 %indvars.iv65, 0
  br i1 %8, label %.lr.ph48, label %._crit_edge49

.lr.ph48:                                         ; preds = %.preheader43
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv65
  %xtraiter71 = and i64 %indvars.iv65, 1
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  br i1 %lcmp.mod72, label %.prol.loopexit70, label %.prol.preheader69

.prol.preheader69:                                ; preds = %.lr.ph48
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 0
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = load double, double* %9, align 8
  %14 = fsub double %13, %12
  store double %14, double* %9, align 8
  br label %.prol.loopexit70

.prol.loopexit70:                                 ; preds = %.prol.preheader69, %.lr.ph48
  %indvars.iv60.unr.ph = phi i64 [ 1, %.prol.preheader69 ], [ 0, %.lr.ph48 ]
  %15 = icmp eq i64 %indvars.iv65, 1
  br i1 %15, label %._crit_edge49, label %.lr.ph48.new.preheader

.lr.ph48.new.preheader:                           ; preds = %.prol.loopexit70
  %16 = sub i64 %5, %indvars.iv60.unr.ph
  %17 = lshr i64 %16, 1
  %18 = and i64 %17, 1
  %lcmp.mod74 = icmp eq i64 %18, 0
  br i1 %lcmp.mod74, label %.lr.ph48.new.prol.preheader, label %.lr.ph48.new.prol.loopexit.unr-lcssa

.lr.ph48.new.prol.preheader:                      ; preds = %.lr.ph48.new.preheader
  br label %.lr.ph48.new.prol

.lr.ph48.new.prol:                                ; preds = %.lr.ph48.new.prol.preheader
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv60.unr.ph
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %20
  %22 = load double, double* %9, align 8
  %23 = fsub double %22, %21
  store double %23, double* %9, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.unr.ph, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next61.prol
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %25
  %27 = fsub double %23, %26
  store double %27, double* %9, align 8
  %indvars.iv.next61.1.prol = or i64 %indvars.iv60.unr.ph, 2
  br label %.lr.ph48.new.prol.loopexit.unr-lcssa

.lr.ph48.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph48.new.preheader, %.lr.ph48.new.prol
  %indvars.iv60.unr.ph75 = phi i64 [ %indvars.iv.next61.1.prol, %.lr.ph48.new.prol ], [ %indvars.iv60.unr.ph, %.lr.ph48.new.preheader ]
  br label %.lr.ph48.new.prol.loopexit

.lr.ph48.new.prol.loopexit:                       ; preds = %.lr.ph48.new.prol.loopexit.unr-lcssa
  %28 = icmp eq i64 %17, 0
  br i1 %28, label %._crit_edge49.loopexit, label %.lr.ph48.new.preheader.new

.lr.ph48.new.preheader.new:                       ; preds = %.lr.ph48.new.prol.loopexit
  br label %.lr.ph48.new

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge ], [ 0, %.preheader.preheader ]
  %29 = icmp sgt i64 %indvars.iv54, 0
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv54
  %xtraiter = and i64 %indvars.iv54, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %31 = load double, double* %7, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 0
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = load double, double* %30, align 8
  %36 = fsub double %35, %34
  store double %36, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %37 = icmp eq i64 %indvars.iv54, 1
  br i1 %37, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = load double, double* %30, align 8
  %44 = fsub double %43, %42
  store double %44, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %30, align 8
  %51 = fsub double %50, %49
  store double %51, double* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv54
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv54, i64 %indvars.iv54
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv54
  %55 = load double, double* %54, align 8
  %56 = fdiv double %55, %53
  store double %56, double* %54, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next55, %indvars.iv65
  br i1 %exitcond59, label %.preheader43, label %.preheader

.lr.ph48.new:                                     ; preds = %.lr.ph48.new, %.lr.ph48.new.preheader.new
  %indvars.iv60 = phi i64 [ %indvars.iv60.unr.ph75, %.lr.ph48.new.preheader.new ], [ %indvars.iv.next61.1.1, %.lr.ph48.new ]
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv60
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %58
  %60 = load double, double* %9, align 8
  %61 = fsub double %60, %59
  store double %61, double* %9, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next61
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %63
  %65 = fsub double %61, %64
  store double %65, double* %9, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next61.1
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %67
  %69 = fsub double %65, %68
  store double %69, double* %9, align 8
  %indvars.iv.next61.176 = add nsw i64 %indvars.iv60, 3
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next61.176
  %71 = load double, double* %70, align 8
  %72 = fmul double %71, %71
  %73 = fsub double %69, %72
  store double %73, double* %9, align 8
  %indvars.iv.next61.1.1 = add nsw i64 %indvars.iv60, 4
  %exitcond64.1.1 = icmp eq i64 %indvars.iv.next61.1.1, %indvars.iv65
  br i1 %exitcond64.1.1, label %._crit_edge49.loopexit.unr-lcssa, label %.lr.ph48.new

._crit_edge49.loopexit.unr-lcssa:                 ; preds = %.lr.ph48.new
  br label %._crit_edge49.loopexit

._crit_edge49.loopexit:                           ; preds = %.lr.ph48.new.prol.loopexit, %._crit_edge49.loopexit.unr-lcssa
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49.loopexit, %.preheader44, %.prol.loopexit70, %.preheader43
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv65
  %75 = load double, double* %74, align 8
  %76 = tail call double @sqrt(double %75) #3
  store double %76, double* %74, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond = icmp eq i64 %indvars.iv.next66, %4
  br i1 %exitcond, label %._crit_edge51.loopexit, label %.preheader44

._crit_edge51.loopexit:                           ; preds = %._crit_edge49
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit, %2
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.preheader, label %._crit_edge15

.preheader.preheader:                             ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv20 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next21, %._crit_edge ]
  %indvars.iv18 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next19, %._crit_edge ]
  %10 = mul nsw i64 %indvars.iv20, %8
  br label %11

; <label>:11:                                     ; preds = %18, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ 0, %.lr.ph ]
  %12 = add nsw i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %11, %16
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv18
  br i1 %exitcond, label %._crit_edge, label %11

._crit_edge:                                      ; preds = %18
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next21, %9
  br i1 %exitcond24, label %._crit_edge15.loopexit, label %.lr.ph

._crit_edge15.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

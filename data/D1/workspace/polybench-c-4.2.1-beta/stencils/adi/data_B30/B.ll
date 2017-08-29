; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %5 = sext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count18 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv16 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next17, %._crit_edge.us ]
  %7 = add nsw i64 %indvars.iv16, %5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, %4
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16, i64 0
  store double %10, double* %11, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %6, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %12 = trunc i64 %7 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ], [ %indvars.iv.next.1, %.preheader.us.new ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sub i32 %12, %13
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %4
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  store double %16, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %19 = sub i32 %12, %18
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %4
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv.next
  store double %21, double* %22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count18
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  %7 = sitofp i32 %1 to double
  %8 = fdiv double 1.000000e+00, %7
  %9 = sitofp i32 %0 to double
  %10 = fdiv double 1.000000e+00, %9
  %11 = fmul double %10, 2.000000e+00
  %12 = fmul double %8, %8
  %13 = fdiv double %11, %12
  %14 = fdiv double %10, %12
  %15 = fmul double %13, -5.000000e-01
  %16 = fadd double %13, 1.000000e+00
  %17 = fmul double %14, -5.000000e-01
  %18 = fadd double %14, 1.000000e+00
  %19 = icmp slt i32 %0, 1
  br i1 %19, label %._crit_edge172, label %.preheader152.lr.ph

.preheader152.lr.ph:                              ; preds = %6
  %20 = add nsw i32 %1, -1
  %21 = icmp sgt i32 %20, 1
  %22 = sext i32 %20 to i64
  %23 = add nsw i32 %1, -2
  %24 = icmp sgt i32 %1, 2
  %25 = fsub double -0.000000e+00, %15
  %26 = fmul double %17, 2.000000e+00
  %27 = fadd double %26, 1.000000e+00
  %28 = fsub double -0.000000e+00, %17
  %29 = fmul double %15, 2.000000e+00
  %30 = fadd double %29, 1.000000e+00
  %31 = sext i32 %23 to i64
  %wide.trip.count = zext i32 %20 to i64
  %xtraiter = and i32 %23, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %32 = icmp eq i32 %1, 3
  %indvars.iv.next174.prol = add nsw i64 %31, -1
  br label %.preheader152

.preheader152:                                    ; preds = %._crit_edge170..preheader152_crit_edge, %.preheader152.lr.ph
  %.0171 = phi i32 [ 1, %.preheader152.lr.ph ], [ %146, %._crit_edge170..preheader152_crit_edge ]
  br i1 %21, label %.lr.ph159.split.us.preheader, label %._crit_edge170

.lr.ph159.split.us.preheader:                     ; preds = %.preheader152
  br label %.lr.ph159.split.us

.lr.ph159.split.us:                               ; preds = %.lr.ph159.split.us.preheader, %._crit_edge157.us
  %indvars.iv175 = phi i64 [ %indvars.iv.next176, %._crit_edge157.us ], [ 1, %.lr.ph159.split.us.preheader ]
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv175
  store double 1.000000e+00, double* %33, align 8
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 0
  store double 0.000000e+00, double* %34, align 8
  %35 = bitcast double* %33 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175
  %38 = bitcast [1000 x double]* %37 to i64*
  store i64 %36, i64* %38, align 8
  %39 = add nsw i64 %indvars.iv175, -1
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  br label %._crit_edge

._crit_edge157.us.loopexit:                       ; preds = %.lr.ph156.us
  br label %._crit_edge157.us

._crit_edge157.us:                                ; preds = %._crit_edge157.us.loopexit, %.lr.ph156.us.prol.loopexit, %._crit_edge.us
  %exitcond178 = icmp eq i64 %indvars.iv.next176, %wide.trip.count
  br i1 %exitcond178, label %.lr.ph162.us.preheader, label %.lr.ph159.split.us

.lr.ph162.us.preheader:                           ; preds = %._crit_edge157.us
  br label %.lr.ph162.us

.lr.ph156.us:                                     ; preds = %.lr.ph156.us.preheader198, %.lr.ph156.us..lr.ph156.us_crit_edge
  %indvars.iv173 = phi i64 [ %indvars.iv.next174.1, %.lr.ph156.us..lr.ph156.us_crit_edge ], [ %indvars.iv173.unr.ph, %.lr.ph156.us.preheader198 ]
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %indvars.iv173
  %41 = load double, double* %40, align 8
  %42 = add nsw i64 %indvars.iv173, 1
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %42, i64 %indvars.iv175
  %44 = load double, double* %43, align 8
  %45 = fmul double %41, %44
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %indvars.iv173
  %47 = load double, double* %46, align 8
  %48 = fadd double %45, %47
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv173, i64 %indvars.iv175
  store double %48, double* %49, align 8
  %indvars.iv.next174 = add nsw i64 %indvars.iv173, -1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %indvars.iv.next174
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %48
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %indvars.iv.next174
  %54 = load double, double* %53, align 8
  %55 = fadd double %52, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next174, i64 %indvars.iv175
  store double %55, double* %56, align 8
  %57 = icmp sgt i64 %indvars.iv.next174, 1
  br i1 %57, label %.lr.ph156.us..lr.ph156.us_crit_edge, label %._crit_edge157.us.loopexit

.lr.ph156.us..lr.ph156.us_crit_edge:              ; preds = %.lr.ph156.us
  %indvars.iv.next174.1 = add nsw i64 %indvars.iv173, -2
  br label %.lr.ph156.us

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph159.split.us
  %indvars.iv = phi i64 [ 1, %.lr.ph159.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %58 = add nsw i64 %indvars.iv, -1
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %58
  %60 = load double, double* %59, align 8
  %61 = fmul double %15, %60
  %62 = fadd double %16, %61
  %63 = fdiv double %25, %62
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %indvars.iv
  store double %63, double* %64, align 8
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %39
  %66 = load double, double* %65, align 8
  %67 = fmul double %17, %66
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv175
  %69 = load double, double* %68, align 8
  %70 = fmul double %27, %69
  %71 = fsub double %70, %67
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next176
  %73 = load double, double* %72, align 8
  %74 = fmul double %17, %73
  %75 = fsub double %71, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %58
  %77 = load double, double* %76, align 8
  %78 = fmul double %15, %77
  %79 = fsub double %75, %78
  %80 = fdiv double %79, %62
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %indvars.iv
  store double %80, double* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %22, i64 %indvars.iv175
  store double 1.000000e+00, double* %82, align 8
  br i1 %24, label %.lr.ph156.us.preheader, label %._crit_edge157.us

.lr.ph156.us.preheader:                           ; preds = %._crit_edge.us
  br i1 %lcmp.mod, label %.lr.ph156.us.prol.loopexit, label %.lr.ph156.us.prol

.lr.ph156.us.prol:                                ; preds = %.lr.ph156.us.preheader
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv175, i64 %31
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv175, i64 %31
  %86 = load double, double* %85, align 8
  %87 = fadd double %84, %86
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %31, i64 %indvars.iv175
  store double %87, double* %88, align 8
  br label %.lr.ph156.us.prol.loopexit

.lr.ph156.us.prol.loopexit:                       ; preds = %.lr.ph156.us.preheader, %.lr.ph156.us.prol
  %indvars.iv173.unr.ph = phi i64 [ %indvars.iv.next174.prol, %.lr.ph156.us.prol ], [ %31, %.lr.ph156.us.preheader ]
  br i1 %32, label %._crit_edge157.us, label %.lr.ph156.us.preheader198

.lr.ph156.us.preheader198:                        ; preds = %.lr.ph156.us.prol.loopexit
  br label %.lr.ph156.us

.lr.ph162.us:                                     ; preds = %.lr.ph162.us.preheader, %._crit_edge167.us
  %indvars.iv187 = phi i64 [ %indvars.iv.next188, %._crit_edge167.us ], [ 1, %.lr.ph162.us.preheader ]
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %89, i64 0, i64 0
  store double 1.000000e+00, double* %90, align 8
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 0
  store double 0.000000e+00, double* %91, align 8
  %92 = bitcast [1000 x double]* %89 to i64*
  %93 = load i64, i64* %92, align 8
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187
  %95 = bitcast [1000 x double]* %94 to i64*
  store i64 %93, i64* %95, align 8
  %96 = add nsw i64 %indvars.iv187, -1
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  br label %._crit_edge196

._crit_edge167.us.loopexit:                       ; preds = %.lr.ph166.us
  br label %._crit_edge167.us

._crit_edge167.us:                                ; preds = %._crit_edge167.us.loopexit, %.lr.ph166.us.prol.loopexit, %._crit_edge163.us
  %exitcond190 = icmp eq i64 %indvars.iv.next188, %wide.trip.count
  br i1 %exitcond190, label %._crit_edge170.loopexit, label %.lr.ph162.us

.lr.ph166.us:                                     ; preds = %.lr.ph166.us.preheader197, %.lr.ph166.us..lr.ph166.us_crit_edge
  %indvars.iv183 = phi i64 [ %indvars.iv.next184.1, %.lr.ph166.us..lr.ph166.us_crit_edge ], [ %indvars.iv183.unr.ph, %.lr.ph166.us.preheader197 ]
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv183
  %98 = load double, double* %97, align 8
  %99 = add nsw i64 %indvars.iv183, 1
  %100 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %99
  %101 = load double, double* %100, align 8
  %102 = fmul double %98, %101
  %103 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv183
  %104 = load double, double* %103, align 8
  %105 = fadd double %102, %104
  %106 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %indvars.iv183
  store double %105, double* %106, align 8
  %indvars.iv.next184 = add nsw i64 %indvars.iv183, -1
  %107 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv.next184
  %108 = load double, double* %107, align 8
  %109 = fmul double %108, %105
  %110 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv.next184
  %111 = load double, double* %110, align 8
  %112 = fadd double %109, %111
  %113 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %indvars.iv.next184
  store double %112, double* %113, align 8
  %114 = icmp sgt i64 %indvars.iv.next184, 1
  br i1 %114, label %.lr.ph166.us..lr.ph166.us_crit_edge, label %._crit_edge167.us.loopexit

.lr.ph166.us..lr.ph166.us_crit_edge:              ; preds = %.lr.ph166.us
  %indvars.iv.next184.1 = add nsw i64 %indvars.iv183, -2
  br label %.lr.ph166.us

._crit_edge196:                                   ; preds = %._crit_edge196, %.lr.ph162.us
  %indvars.iv179 = phi i64 [ 1, %.lr.ph162.us ], [ %indvars.iv.next180, %._crit_edge196 ]
  %115 = add nsw i64 %indvars.iv179, -1
  %116 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %115
  %117 = load double, double* %116, align 8
  %118 = fmul double %17, %117
  %119 = fadd double %18, %118
  %120 = fdiv double %28, %119
  %121 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %indvars.iv179
  store double %120, double* %121, align 8
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %96, i64 %indvars.iv179
  %123 = load double, double* %122, align 8
  %124 = fmul double %15, %123
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv187, i64 %indvars.iv179
  %126 = load double, double* %125, align 8
  %127 = fmul double %30, %126
  %128 = fsub double %127, %124
  %129 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next188, i64 %indvars.iv179
  %130 = load double, double* %129, align 8
  %131 = fmul double %15, %130
  %132 = fsub double %128, %131
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %115
  %134 = load double, double* %133, align 8
  %135 = fmul double %17, %134
  %136 = fsub double %132, %135
  %137 = fdiv double %136, %119
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %indvars.iv179
  store double %137, double* %138, align 8
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next180, %wide.trip.count
  br i1 %exitcond182, label %._crit_edge163.us, label %._crit_edge196

._crit_edge163.us:                                ; preds = %._crit_edge196
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %22
  store double 1.000000e+00, double* %139, align 8
  br i1 %24, label %.lr.ph166.us.preheader, label %._crit_edge167.us

.lr.ph166.us.preheader:                           ; preds = %._crit_edge163.us
  br i1 %lcmp.mod, label %.lr.ph166.us.prol.loopexit, label %.lr.ph166.us.prol

.lr.ph166.us.prol:                                ; preds = %.lr.ph166.us.preheader
  %140 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv187, i64 %31
  %141 = load double, double* %140, align 8
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv187, i64 %31
  %143 = load double, double* %142, align 8
  %144 = fadd double %141, %143
  %145 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv187, i64 %31
  store double %144, double* %145, align 8
  br label %.lr.ph166.us.prol.loopexit

.lr.ph166.us.prol.loopexit:                       ; preds = %.lr.ph166.us.preheader, %.lr.ph166.us.prol
  %indvars.iv183.unr.ph = phi i64 [ %indvars.iv.next174.prol, %.lr.ph166.us.prol ], [ %31, %.lr.ph166.us.preheader ]
  br i1 %32, label %._crit_edge167.us, label %.lr.ph166.us.preheader197

.lr.ph166.us.preheader197:                        ; preds = %.lr.ph166.us.prol.loopexit
  br label %.lr.ph166.us

._crit_edge170.loopexit:                          ; preds = %._crit_edge167.us
  br label %._crit_edge170

._crit_edge170:                                   ; preds = %._crit_edge170.loopexit, %.preheader152
  %exitcond191 = icmp eq i32 %.0171, %0
  br i1 %exitcond191, label %._crit_edge172.loopexit, label %._crit_edge170..preheader152_crit_edge

._crit_edge170..preheader152_crit_edge:           ; preds = %._crit_edge170
  %146 = add nuw nsw i32 %.0171, 1
  br label %.preheader152

._crit_edge172.loopexit:                          ; preds = %._crit_edge170
  br label %._crit_edge172

._crit_edge172:                                   ; preds = %._crit_edge172.loopexit, %6
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv15, %8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nsw i64 %indvars.iv, %9
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge19
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge19

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count
  br i1 %exitcond18, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %2
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
